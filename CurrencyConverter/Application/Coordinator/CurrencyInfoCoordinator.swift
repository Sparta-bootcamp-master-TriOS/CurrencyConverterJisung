import UIKit

final class CurrencyInfoCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer

    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func makeCurrencyInfoViewController() -> UIViewController {
        let currencyInfoViewController = appDIContainer.makeCurrencyInfoViewController()
        currencyInfoViewController.coordinator = self

        return currencyInfoViewController
    }

    func pushCurrencyConverter(code: String, name: String) {
        let currencyConverterViewController = appDIContainer.makeCurrencyConverterViewController(code: code, name: name)
        navigationController.pushViewController(currencyConverterViewController, animated: true)
    }
}
