public struct SaveLastSeenSceneDataSource {
    private let persistenceController: PersistenceController

    public init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    /// CoreData에 마지막으로 본 화면 정보를 저장하는 메서드
    ///
    /// - Parameters:
    ///   - scene: 사용자가 마지막으로 본 화면의 이름
    ///   - code: 해당 화면에서 선택된 통화 코드 (옵셔널)
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
