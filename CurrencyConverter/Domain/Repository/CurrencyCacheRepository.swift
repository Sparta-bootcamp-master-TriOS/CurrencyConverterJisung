public protocol CurrencyCacheRepository {
    func cache(meta: CurrencyMeta, currencies: [Currency]?)
    func currency(by code: String) -> Currency?
}
