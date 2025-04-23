import DomainLayer

public final class DefaultSaveFavoriteUseCase: SaveFavoriteUseCase {
    private let favoriteRepository: FavoriteRepository

    public init(favoriteRepository: FavoriteRepository) {
        self.favoriteRepository = favoriteRepository
    }

    /// 즐겨찾기 상태를 저장(토글)하는 메서드
    ///
    /// - Parameter code: 즐겨찾기 상태를 변경할 통화 코드
    public func execute(by code: String) {
        favoriteRepository.save(by: code)
    }
}
