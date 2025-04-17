final class DefaultCurrencyRepository: CurrencyRepository {
    private let currencyDataSource: CurrencyDataSource
    private let mapper = CurrencyMapper()

    private var cachedCurrencyMeta: CurrencyMeta?
    private var cachedCurrencies: [Currency]?

    init(currencyDataSource: CurrencyDataSource) {
        self.currencyDataSource = currencyDataSource
    }

    /// 환율 데이터를 가져오는 메서드
    ///
    /// - Parameter completion: 요청 결과를 전달하는 클로저. 성공 시 `CurrencyMeta`와 `Currency` 배열을 포함
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

    func currency(by code: String) -> Currency? {
        cachedCurrencies?.first(where: { $0.code == code })
    }
}
