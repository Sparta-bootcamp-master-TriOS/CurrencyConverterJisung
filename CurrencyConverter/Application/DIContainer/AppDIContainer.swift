import Foundation

final class AppDIContainer {
    static let baseURL = AppConstant.baseURL

    var dataSourceDIContainer = DataSourceDIContainer(baseURL: baseURL)
    lazy var repositoryDIContainer = RepositoryDIContainer(dataSourceDIContainer: dataSourceDIContainer)
    lazy var useCaseDIContainer = UseCaseDIContainer(repositoryDIContainer: repositoryDIContainer)

    // MARK: - ViewModel

    func makeCurrencyInfoViewModel() -> CurrencyInfoViewModel {
        CurrencyInfoViewModel(fetchCurrencyUseCase: useCaseDIContainer.makeFetchCurrencyUseCase())
    }

    // MARK: - ViewController

    func makeCurrencyInfoViewController() -> CurrencyInfoViewController {
        CurrencyInfoViewController(currencyInfoViewModel: makeCurrencyInfoViewModel())
    }

    func makeCurrencyConverterViewController() -> CurrencyConverterViewController {
        CurrencyConverterViewController()
    }
}
