protocol FetchCurrencyUseCase {
    func fetchCurrencies(completion: @escaping (Result<(CurrencyMeta, [Currency]), Error>) -> Void)
}
