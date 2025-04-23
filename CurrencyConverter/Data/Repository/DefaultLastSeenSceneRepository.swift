import DomainLayer

public final class DefaultLastSeenSceneRepository: LastSeenSceneRepository {
    private let fetchLastSeenSceneDataSource: FetchLastSeenSceneDataSource
    private let saveLastSeenSceneDataSource: SaveLastSeenSceneDataSource

    public init(
        fetchLastSeenSceneDataSource: FetchLastSeenSceneDataSource,
        saveLastSeenSceneDataSource: SaveLastSeenSceneDataSource
    ) {
        self.fetchLastSeenSceneDataSource = fetchLastSeenSceneDataSource
        self.saveLastSeenSceneDataSource = saveLastSeenSceneDataSource
    }

    /// 사용자가 마지막으로 본 화면 정보를 가져오는 메서드
    ///
    /// - Returns: 마지막으로 본 화면의 이름과 선택된 통화 코드의 튜플. 값이 없으면 `nil`
    public func fetch() -> (scene: String, code: String?)? {
        guard let lastSeen = fetchLastSeenSceneDataSource.execute() else {
            return .none
        }

        return (lastSeen.scene, lastSeen.selectedCureencyCode)
    }

    /// 사용자가 마지막으로 본 화면 정보를 저장하는 메서드
    ///
    /// - Parameters:
    ///   - scene: 저장할 화면의 이름
    ///   - code: 선택된 통화 코드 (옵셔널)
    public func save(scene: String, code: String?) {
        saveLastSeenSceneDataSource.execute(scene: scene, code: code)
    }
}
