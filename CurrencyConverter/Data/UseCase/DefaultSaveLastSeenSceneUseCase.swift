import DomainLayer

public final class DefaultSaveLastSeenSceneUseCase: SaveLastSeenSceneUseCase {
    private let lastSeenSceneRepository: LastSeenSceneRepository

    public init(lastSeenSceneRepository: LastSeenSceneRepository) {
        self.lastSeenSceneRepository = lastSeenSceneRepository
    }

    /// 마지막으로 본 화면 정보를 저장하는 메서드
    ///
    /// - Parameters:
    ///   - scene: 현재 보고 있는 화면 이름
    ///   - code: 해당 화면에서 선택된 통화 코드 (옵셔널)
    public func execute(scene: String, code: String?) {
        lastSeenSceneRepository.save(scene: scene, code: code)
    }
}
