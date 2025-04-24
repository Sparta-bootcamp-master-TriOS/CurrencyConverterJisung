struct DefaultCurrencyRepository: CurrencyRepository {
    private let currencyDataSource: CurrencyDataSource
    private let currencyMapper: CurrencyMapper

    init(currencyDataSource: CurrencyDataSource, currencyMapper: CurrencyMapper) {
        self.currencyDataSource = currencyDataSource
        self.currencyMapper = currencyMapper
    }
    
    /// 환율 데이터를 가져오는 메서드
    ///
    /// - Parameter completion: 요청 결과를 전달하는 클로저. 성공 시 `CurrencyMeta`와 `Currency` 배열을 포함
    func fetchCurrencies(completion: @escaping (Result<(CurrencyMeta, [Currency]), Error>) -> Void) {
        currencyDataSource.fetchCurrency { (result: Result<CurrencyResponse, Error>) in
            switch result {
            case let .success(response):
                let (meta, currencies) = currencyMapper.mapToCurrency(from: response)
                completion(.success((meta, currencies)))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
