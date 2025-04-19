struct DefaultFetchFavoriteUseCase: FetchFavoriteUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    func fetchFavorites() -> [String: Bool]? {
        guard let favorites = currencyRepository.fetchFavorites() else { return .none }

        return Dictionary(uniqueKeysWithValues: favorites.map { ($0.code, $0.isFavorite) })
    }
}
