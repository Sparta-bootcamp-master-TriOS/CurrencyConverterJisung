public protocol LastSeenSceneRepository {
    func fetch() -> (scene: String, code: String?)?
    func save(scene: String, code: String?)
}
