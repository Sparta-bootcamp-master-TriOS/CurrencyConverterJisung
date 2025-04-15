protocol FetchCurrencyUseCase {
    func fetchCurrencies(completion: @escaping (Result<(CurrencyMeta, [CurrencyRate]), Error>) -> Void)
}
