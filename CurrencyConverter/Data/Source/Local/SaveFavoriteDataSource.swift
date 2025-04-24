import CoreData

struct SaveFavoriteDataSource {
    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    /// 즐겨찾기 정보를 저장하는 메서드
    ///
    /// 해당 통화 코드가 이미 존재하면 `isFavorite` 상태를 토글하고, 존재하지 않으면 새로 생성한다.
    ///
    /// - Parameter code: 즐겨찾기 상태를 변경할 통화 코드
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
