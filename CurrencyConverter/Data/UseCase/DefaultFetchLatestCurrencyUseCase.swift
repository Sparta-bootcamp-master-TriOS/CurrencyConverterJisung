struct DefaultFetchLatestCurrencyUseCase: FetchLatestCurrencyUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    func fetchLatestCurrencies() -> [Currency]? {
        currencyRepository.fetchLatestCurrencies()
    }
}
