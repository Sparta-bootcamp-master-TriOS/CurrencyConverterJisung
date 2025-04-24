protocol CurrencyRepository {
    func fetchCurrencies(completion: @escaping (Result<(CurrencyMeta, [Currency]), Error>) -> Void)
    func currency(by code: String) -> Currency?
}
