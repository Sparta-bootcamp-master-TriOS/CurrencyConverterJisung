import Foundation

final class AppDIContainer {
    static let baseURL = AppConstant.baseURL

    var dataSourceDIContainer = DataSourceDIContainer(baseURL: baseURL)
    lazy var repositoryDIContainer = RepositoryDIContainer(dataSourceDIContainer: dataSourceDIContainer)
    lazy var useCaseDIContainer = UseCaseDIContainer(repositoryDIContainer: repositoryDIContainer)

    // MARK: - ViewModel

    /// CurrencyInfoViewModel 생성
    func makeCurrencyInfoViewModel() -> CurrencyInfoViewModel {
        CurrencyInfoViewModel(fetchCurrencyUseCase: useCaseDIContainer.makeFetchCurrencyUseCase())
    }

    /// CurrencyConverterViewModel 생성
    func makeCurrencyConverterViewModel(with currency: CurrencyDisplay) -> CurrencyConverterViewModel {
        CurrencyConverterViewModel(
            convertCurrencyUseCase: useCaseDIContainer.makeConvertCurrencyUseCase(),
            currency: currency
        )
    }

    // MARK: - ViewController

    /// CurrencyInfoViewController 생성
    func makeCurrencyInfoViewController() -> CurrencyInfoViewController {
        CurrencyInfoViewController(currencyInfoViewModel: makeCurrencyInfoViewModel())
    }

    /// CurrencyConverterViewController 생성
    func makeCurrencyConverterViewController(with currency: CurrencyDisplay) -> CurrencyConverterViewController {
        CurrencyConverterViewController(currencyConverterViewModel: makeCurrencyConverterViewModel(with: currency))
    }
}
