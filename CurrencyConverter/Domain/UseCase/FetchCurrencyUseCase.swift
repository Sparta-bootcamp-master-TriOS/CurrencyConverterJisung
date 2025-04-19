protocol FetchCurrencyUseCase {
    func fetchCurrencies(completion: @escaping (Result<[Currency], Error>) -> Void)
}
