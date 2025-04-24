public struct FetchFavoriteDataSource {
    private let persistenceController: PersistenceController

    public init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    /// CoreData에서 즐겨찾기 데이터를 가져오는 메서드
    ///
    /// - Returns: 저장된 `FavoriteEntity` 배열. 없을 경우 `nil` 반환.
    func fetchFavorites() -> [FavoriteEntity]? {
        let context = persistenceController.context

        let request = FavoriteEntity.fetchRequest()

        let result = try? context.fetch(request)

        return result
    }
}
