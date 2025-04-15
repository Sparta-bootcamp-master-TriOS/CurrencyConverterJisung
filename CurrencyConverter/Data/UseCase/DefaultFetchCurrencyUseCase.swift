struct DefaultFetchCurrencyUseCase: FetchCurrencyUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    func fetchCurrencies(completion: @escaping (Result<(CurrencyMeta, [Currency]), Error>) -> Void) {
        currencyRepository.fetchCurrencies(completion: completion)
    }
}
