public protocol CurrencyRepository {
    func fetch(completion: @escaping (Result<(meta: CurrencyMeta, currencies: [Currency]), Error>) -> Void)
}
