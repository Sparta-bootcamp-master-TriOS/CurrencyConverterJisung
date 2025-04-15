struct DefaultCurrencyRepository: CurrencyRepository {
    private let currencyDataSource: CurrencyDataSource
    private let currencyMapper: CurrencyMapper

    init(currencyDataSource: CurrencyDataSource, currencyMapper: CurrencyMapper) {
        self.currencyDataSource = currencyDataSource
        self.currencyMapper = currencyMapper
    }

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
