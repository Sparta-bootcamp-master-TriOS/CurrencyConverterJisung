import DomainLayer

public final class DefaultFetchLastSeenSceneUseCase: FetchLastSeenSceneUseCase {
    private let lastSeenSceneRepository: LastSeenSceneRepository

    public init(lastSeenSceneRepository: LastSeenSceneRepository) {
        self.lastSeenSceneRepository = lastSeenSceneRepository
    }

    /// 마지막으로 본 화면 정보를 가져오는 메서드
    ///
    /// - Returns: 마지막으로 본 화면 정보와 선택된 통화 코드가 포함된 튜플 `(scene: String, code: String?)`.
    ///            정보가 없을 경우 `nil`을 반환.
    public func execute() -> (scene: String, code: String?)? {
        guard let lastSeen = lastSeenSceneRepository.fetch() else {
            return .none
        }

        return lastSeen
    }
}
