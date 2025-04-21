protocol CurrencyRepository {
    func fetchCurrencies(completion: @escaping (Result<[Currency], Error>) -> Void)
    func fetchLatestCurrencies() -> [Currency]?
    func fetchFavorites() -> [Favorite]?
    func saveFavorite(by code: String)
    func currency(by code: String) -> Currency?
    func fetchLastSeen() -> (scene: String, code: String?)?
    func saveLastSeen(scene: String, code: String?)
}
