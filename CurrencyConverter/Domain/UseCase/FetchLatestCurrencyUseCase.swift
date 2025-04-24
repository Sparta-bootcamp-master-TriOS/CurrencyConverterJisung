public protocol FetchLatestCurrencyUseCase {
    func execute() -> [Currency]?
}
