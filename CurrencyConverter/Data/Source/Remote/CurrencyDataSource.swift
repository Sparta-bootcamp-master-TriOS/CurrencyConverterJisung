protocol CurrencyDataSource {
    func fetchCurrency<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void)
}
