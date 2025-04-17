final class UseCaseDIContainer {
    private let repositoryDIContainer: RepositoryDIContainer

    init(repositoryDIContainer: RepositoryDIContainer) {
        self.repositoryDIContainer = repositoryDIContainer
    }

    /// FetchCurrencyUseCase 생성
    func makeFetchCurrencyUseCase() -> FetchCurrencyUseCase {
        DefaultFetchCurrencyUseCase(currencyRepository: repositoryDIContainer.makeCurrencyRepository())
    }

    /// ConvertCurrencyUseCase 생성
    func makeConvertCurrencyUseCase() -> ConvertCurrencyUseCase {
        DefaultConvertCurrencyUseCase(currencyRepository: repositoryDIContainer.makeCurrencyRepository())
    }
}
