struct DefaultFetchLastSeenSceneUseCase: FetchLastSeenSceneUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    func execute() -> (scene: String, code: String?)? {
        guard let lastSeen = currencyRepository.fetchLastSeen() else {
            return .none
        }

        return lastSeen
    }
}
