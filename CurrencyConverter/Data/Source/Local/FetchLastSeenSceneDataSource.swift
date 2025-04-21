struct FetchLastSeenSceneDataSource {
    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func fetchLastSeen() -> LastSeenSceneInfoEntity? {
        let context = persistenceController.context

        let request = LastSeenSceneInfoEntity.fetchRequest()

        let result = try? context.fetch(request)

        return result?.first
    }
}
