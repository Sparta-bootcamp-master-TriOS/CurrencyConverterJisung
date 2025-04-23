// import CoreData
import DomainLayer

public final class DefaultFavoriteRepository: FavoriteRepository {
    private let fetchFavoriteDataSource: FetchFavoriteDataSource
    private let saveFavoriteDataSource: SaveFavoriteDataSource

    private let mapper = CurrencyMapper.shared

    public init(
        fetchFavoriteDataSource: FetchFavoriteDataSource,
        saveFavoriteDataSource: SaveFavoriteDataSource
    ) {
        self.fetchFavoriteDataSource = fetchFavoriteDataSource
        self.saveFavoriteDataSource = saveFavoriteDataSource
    }

    /// CoreData에서 즐겨찾기 정보를 가져오는 메서드
    ///
    /// - Returns: 즐겨찾기 목록. 존재하지 않으면 `nil` 반환
    public func fetch() -> [Favorite]? {
        guard let favorites = fetchFavoriteDataSource.execute() else { return .none }

        return favorites.map { mapper.map(from: $0) }
    }

    /// 통화 코드를 기준으로 즐겨찾기 여부를 저장하는 메서드.
    ///
    /// - Parameter code: 즐겨찾기에 추가할 통화 코드
    public func save(by code: String) {
        saveFavoriteDataSource.execute(by: code)
    }
}
