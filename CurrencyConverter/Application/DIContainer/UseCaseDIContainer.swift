final class UseCaseDIContainer {
    private let repositoryDIContainer: RepositoryDIContainer
    private lazy var currencyRepository = repositoryDIContainer.makeCurrencyRepository()

    init(repositoryDIContainer: RepositoryDIContainer) {
        self.repositoryDIContainer = repositoryDIContainer
    }

    /// FetchCurrencyUseCase 생성
    func makeFetchCurrencyUseCase() -> FetchCurrencyUseCase {
        DefaultFetchCurrencyUseCase(currencyRepository: currencyRepository)
    }

    /// FetchLatestCurrencyUseCase 생성
    func makeFetchLatestCurrencyUseCase() -> FetchLatestCurrencyUseCase {
        DefaultFetchLatestCurrencyUseCase(currencyRepository: currencyRepository)
    }

    /// FetchFavoriteUseCase 생성
    func makeFetchFavoriteUseCase() -> FetchFavoriteUseCase {
        DefaultFetchFavoriteUseCase(currencyRepository: currencyRepository)
    }

    /// ConvertCurrencyUseCase 생성
    func makeConvertCurrencyUseCase() -> ConvertCurrencyUseCase {
        DefaultConvertCurrencyUseCase(currencyRepository: currencyRepository)
    }

    /// SaveFavoriteUseCase 생성
    func makeSaveFavoriteUseCase() -> SaveFavoriteUseCase {
        DefaultSaveFavoriteUseCase(currencyRepository: currencyRepository)
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
        DefaultFetchLastSeenSceneUseCase(currencyRepository: currencyRepository)
    }
    
    /// SaveLastSeenSceneUseCase 생성
    func makeSaveLastSeenSceneUseCase() -> SaveLastSeenSceneUseCase {
        DefaultSaveLastSeenSceneUseCase(currencyRepository: currencyRepository)
    }
}
