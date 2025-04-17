final class DefaultCurrencyRepository: CurrencyRepository {
    private let currencyDataSource: CurrencyDataSource
    private let mapper = CurrencyMapper()

    private var cachedCurrencyMeta: CurrencyMeta?
    private var cachedCurrencies: [Currency]?

    init(currencyDataSource: CurrencyDataSource) {
        self.currencyDataSource = currencyDataSource
    }

    /// 환율 데이터를 서버 또는 캐시에서 가져오는 메서드
    ///
    /// - Parameter completion: 요청 결과를 전달하는 클로저. 성공 시 `CurrencyMeta`와 `Currency` 배열을 포함
    /// - Note:
    ///     - 캐시된 데이터가 있다면 네트워크 요청 없이 캐시 데이터를 반환한다.
    ///     - 그렇지 않으면 서버에서 데이터를 요청하고, 가져온 데이터를 캐시한다.
    func fetchCurrencies(completion: @escaping (Result<(CurrencyMeta, [Currency]), Error>) -> Void) {
        if let meta = cachedCurrencyMeta, let currencies = cachedCurrencies {
            completion(.success((meta, currencies)))

            return
        }

        currencyDataSource.fetchCurrency { [weak self] (result: Result<CurrencyResponse, Error>) in
            guard let self else { return }
            switch result {
            case let .success(response):
                let (meta, currencies) = self.mapper.map(from: response)

                self.cachedCurrencyMeta = meta
                self.cachedCurrencies = currencies

                completion(.success((meta, currencies)))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    /// 특정 통화 코드에 해당하는 환율 정보를 반환하는 메서드
    ///
    /// - Parameter code: 검색할 통화 코드
    /// - Returns: 해당 코드의 `Currency` 객체, 없으면 `nil`
    func currency(by code: String) -> Currency? {
        cachedCurrencies?.first(where: { $0.code == code })
    }
}
