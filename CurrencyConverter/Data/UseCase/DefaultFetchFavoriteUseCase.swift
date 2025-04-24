import DomainLayer

public struct DefaultFetchFavoriteUseCase: FetchFavoriteUseCase {
    private let currencyRepository: CurrencyRepository

    public init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    /// CoreData에 저장된 즐겨찾기 데이터를 가져오는 메서드
    ///
    /// - Returns: 통화 코드와 해당 즐겨찾기 여부를 담은 딕셔너리. 없을 경우 `nil`
    public func execute() -> [String: Bool]? {
        guard let favorites = currencyRepository.fetchFavorites() else { return .none }

        return Dictionary(uniqueKeysWithValues: favorites.map { ($0.code, $0.isFavorite) })
    }
}
