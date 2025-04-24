struct DefaultSaveFavoriteUseCase: SaveFavoriteUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    /// 즐겨찾기 상태를 저장(토글)하는 메서드
    ///
    /// - Parameter code: 즐겨찾기 상태를 변경할 통화 코드
    func execute(by code: String) {
        currencyRepository.saveFavorite(by: code)
    }
}
