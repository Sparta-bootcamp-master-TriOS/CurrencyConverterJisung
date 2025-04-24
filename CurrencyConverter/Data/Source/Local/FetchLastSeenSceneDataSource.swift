struct FetchLastSeenSceneDataSource {
    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    /// CoreData에서 마지막으로 본 화면 정보를 가져오는 메서드
    ///
    /// - Returns: `LastSeenSceneInfoEntity` 객체. 저장된 정보가 없으면 `nil` 반환.
    func fetchLastSeen() -> LastSeenSceneInfoEntity? {
        let context = persistenceController.context

        let request = LastSeenSceneInfoEntity.fetchRequest()

        let result = try? context.fetch(request)

        return result?.first
    }
}
