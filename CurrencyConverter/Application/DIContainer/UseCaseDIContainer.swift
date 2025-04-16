final class UseCaseDIContainer {
    private let repositoryDIContainer: RepositoryDIContainer

    init(repositoryDIContainer: RepositoryDIContainer) {
        self.repositoryDIContainer = repositoryDIContainer
    }

    func makeFetchCurrencyUseCase() -> FetchCurrencyUseCase {
        DefaultFetchCurrencyUseCase(currencyRepository: repositoryDIContainer.makeCurrencyRepository())
    }

    func makeConvertCurrencyUseCase() -> ConvertCurrencyUseCase {
        DefaultConvertCurrencyUseCase()
    }
}
