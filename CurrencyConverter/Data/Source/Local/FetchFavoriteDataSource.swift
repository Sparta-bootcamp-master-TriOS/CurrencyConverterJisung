struct FetchFavoriteDataSource {
    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func fetchFavorites() -> [FavoriteEntity]? {
        let context = persistenceController.context

        let request = FavoriteEntity.fetchRequest()

        let result = try? context.fetch(request)

        return result
    }
}
