public protocol FavoriteRepository {
    func fetch() -> [Favorite]?
    func save(by code: String)
}
