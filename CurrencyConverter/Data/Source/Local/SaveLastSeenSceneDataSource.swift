struct SaveLastSeenSceneDataSource {
    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func saveLastSeen(scene: String, code: String?) {
        let context = persistenceController.context

        let request = LastSeenSceneInfoEntity.fetchRequest()

        let result = try? context.fetch(request)

        if let entity = result?.first {
            entity.scene = scene
            entity.selectedCureencyCode = code
        } else {
            let entity = LastSeenSceneInfoEntity(context: context)
            entity.scene = scene
            entity.selectedCureencyCode = code
        }

        persistenceController.saveContext()
    }
}
