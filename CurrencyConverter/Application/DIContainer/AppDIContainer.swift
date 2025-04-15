import Foundation

final class AppDIContainer {
    static let baseURL = AppConstant.baseURL

    var dataSourceDIContainer = DataSourceDIContainer(baseURL: baseURL)
    lazy var repositoryDIContainer = RepositoryDIContainer(dataSourceDIContainer: dataSourceDIContainer)
    lazy var useCaseDIContainer = UseCaseDIContainer(repositoryDIContainer: repositoryDIContainer)

    func makeCurrencyInfoViewModel() -> CurrencyInfoViewModel {
        CurrencyInfoViewModel(fetchCurrencyUseCase: useCaseDIContainer.makeFetchCurrencyUseCase())
    }

    func makeCurrencyInfoViewController() -> CurrencyInfoViewController {
        CurrencyInfoViewController(currencyInfoViewModel: makeCurrencyInfoViewModel())
    }
}
