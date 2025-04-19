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

    func makeFetchLatestCurrencyUseCase() -> FetchLatestCurrencyUseCase {
        DefaultFetchLatestCurrencyUseCase(currencyRepository: currencyRepository)
    }

    func makeFetchFavoriteUseCase() -> FetchFavoriteUseCase {
        DefaultFetchFavoriteUseCase(currencyRepository: currencyRepository)
    }

    /// ConvertCurrencyUseCase 생성
    func makeConvertCurrencyUseCase() -> ConvertCurrencyUseCase {
        DefaultConvertCurrencyUseCase(currencyRepository: currencyRepository)
    }

    func makeSaveFavoriteUseCase() -> SaveFavoriteUseCase {
        DefaultSaveFavoriteUseCase(currencyRepository: currencyRepository)
    }
}
