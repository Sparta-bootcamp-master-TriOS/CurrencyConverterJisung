public protocol FetchCurrencyUseCase {
    func execute(completion: @escaping (Result<[Currency], Error>) -> Void)
}
