import DataLayer
import DomainLayer

extension DIContainer {
    /// FetchCurrencyUseCase 생성
    func makeFetchCurrencyUseCase() -> FetchCurrencyUseCase {
        DefaultFetchCurrencyUseCase(
            currencyRepository: makeCurrencyRepository(),
            currencyCacheRepository: currencyCacheRepository
        )
    }

    /// FetchLatestCurrencyUseCase 생성
    func makeFetchLatestCurrencyUseCase() -> FetchLatestCurrencyUseCase {
        DefaultFetchLatestCurrencyUseCase(latestCurrencyRepository: makeLatestCurrencyRepository())
    }

    /// FetchFavoriteUseCase 생성
    func makeFetchFavoriteUseCase() -> FetchFavoriteUseCase {
        DefaultFetchFavoriteUseCase(favoriteRepository: makeFavoriteRepository())
    }

    /// SaveFavoriteUseCase 생성
    func makeSaveFavoriteUseCase() -> SaveFavoriteUseCase {
        DefaultSaveFavoriteUseCase(favoriteRepository: makeFavoriteRepository())
    }

    /// ConvertCurrencyUseCase 생성
    func makeConvertCurrencyUseCase() -> ConvertCurrencyUseCase {
        DefaultConvertCurrencyUseCase(currencyCacheRepository: currencyCacheRepository)
    }

    /// CompareCurrencyUseCase 생성
    func makeCompareCurrencyUseCase() -> CompareCurrencyUseCase {
        DefaultCompareCurrencyUseCase()
    }

    /// FetchAndCompareCurrencyUseCase 생성
    func makeFetchAndCompareCurrencyUseCase() -> FetchAndCompareCurrencyUseCase {
        DefaultFetchAndCompareCurrencyUseCase(
            fetchCurrencyUseCase: makeFetchCurrencyUseCase(),
            fetchLatestCurrencyUseCase: makeFetchLatestCurrencyUseCase(),
            compareCurrencyUseCase: makeCompareCurrencyUseCase()
        )
    }

    /// FetchLastSeenSceneUseCase 생성
    func makeFetchLastSeenSceneUseCase() -> FetchLastSeenSceneUseCase {
        DefaultFetchLastSeenSceneUseCase(lastSeenSceneRepository: makeLastSeenSceneRepository())
    }

    /// SaveLastSeenSceneUseCase 생성
    func makeSaveLastSeenSceneUseCase() -> SaveLastSeenSceneUseCase {
        DefaultSaveLastSeenSceneUseCase(lastSeenSceneRepository: makeLastSeenSceneRepository())
    }
}
