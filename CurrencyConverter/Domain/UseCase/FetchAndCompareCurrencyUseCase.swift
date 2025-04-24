public protocol FetchAndCompareCurrencyUseCase {
    func execute(completion: @escaping (Result<[Currency], Error>) -> Void)
}
