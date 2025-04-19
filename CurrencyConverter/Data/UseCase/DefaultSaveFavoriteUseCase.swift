struct DefaultSaveFavoriteUseCase: SaveFavoriteUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    func saveFavorite(by code: String) {
        currencyRepository.saveFavorite(by: code)
    }
}
