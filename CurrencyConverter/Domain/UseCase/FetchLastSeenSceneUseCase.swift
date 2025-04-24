public protocol FetchLastSeenSceneUseCase {
    func execute() -> (scene: String, code: String?)?
}
