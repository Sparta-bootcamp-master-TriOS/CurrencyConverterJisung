public protocol LatestCurrencyRepository {
    func fetch() -> [Currency]?
}
