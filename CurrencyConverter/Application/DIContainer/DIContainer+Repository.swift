import DataLayer
import DomainLayer

extension DIContainer {
    /// CurrencyRepository 생성
    func makeCurrencyRepository() -> CurrencyRepository {
        DefaultCurrencyRepository(
            fetchCurrencyDataSource: makeFetchCurrencyDataSource(),
            saveCurrencyDataSource: makeSaveCurrencyDataSource()
        )
    }

    /// LatestCurrencyRepository 생성
    func makeLatestCurrencyRepository() -> LatestCurrencyRepository {
        DefaultLatestCurrencyRepository(fetchLatestCurrencyDataSource: makeFetchLatestCurrencyDataSource())
    }

    /// FavoriteRepository 생성
    func makeFavoriteRepository() -> FavoriteRepository {
        DefaultFavoriteRepository(
            fetchFavoriteDataSource: makeFetchFavoriteDataSource(),
            saveFavoriteDataSource: makeSaveFavoriteDataSource()
        )
    }

    /// LastSeenSceneRepository 생성
    func makeLastSeenSceneRepository() -> LastSeenSceneRepository {
        DefaultLastSeenSceneRepository(
            fetchLastSeenSceneDataSource: makeFetchLastSeenSceneDataSource(),
            saveLastSeenSceneDataSource: makeSaveLastSeenSceneDataSource()
        )
    }

    /// CurrencyCacheRepository 생성
    func makeCurrencyCacheRepository() -> CurrencyCacheRepository {
        DefaultCurrencyCacheRepository()
    }
}
