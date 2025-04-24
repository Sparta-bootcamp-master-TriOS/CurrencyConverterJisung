import CoreData

struct SaveFavoriteDataSource {
    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func saveFavorite(by code: String) {
        let context = persistenceController.context

        let request = FavoriteEntity.fetchRequest()
        request.predicate = NSPredicate(format: SourceConstant.Local.codeFormat, code)

        let result = try? context.fetch(request)

        if let entity = result?.first {
            entity.isFavorite.toggle()
        } else {
            let entity = FavoriteEntity(context: context)
            entity.code = code
            entity.isFavorite = true
        }

        persistenceController.saveContext()
    }
}
