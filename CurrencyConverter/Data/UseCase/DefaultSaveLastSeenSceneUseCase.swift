struct DefaultSaveLastSeenSceneUseCase: SaveLastSeenSceneUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    func execute(scene: String, code: String?) {
        currencyRepository.saveLastSeen(scene: scene, code: code)
    }
}
