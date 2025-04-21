struct DefaultSaveLastSeenSceneUseCase: SaveLastSeenSceneUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    /// 마지막으로 본 화면 정보를 저장하는 메서드
    ///
    /// - Parameters:
    ///   - scene: 현재 보고 있는 화면 이름
    ///   - code: 해당 화면에서 선택된 통화 코드 (옵셔널)
    func execute(scene: String, code: String?) {
        currencyRepository.saveLastSeen(scene: scene, code: code)
    }
}
