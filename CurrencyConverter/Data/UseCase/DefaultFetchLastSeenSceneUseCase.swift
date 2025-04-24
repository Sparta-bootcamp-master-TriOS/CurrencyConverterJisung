struct DefaultFetchLastSeenSceneUseCase: FetchLastSeenSceneUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    /// 마지막으로 본 화면 정보를 가져오는 메서드
    ///
    /// - Returns: 마지막으로 본 화면 정보와 선택된 통화 코드가 포함된 튜플 `(scene: String, code: String?)`.
    ///            정보가 없을 경우 `nil`을 반환.
    func execute() -> (scene: String, code: String?)? {
        guard let lastSeen = currencyRepository.fetchLastSeen() else {
            return .none
        }

        return lastSeen
    }
}
