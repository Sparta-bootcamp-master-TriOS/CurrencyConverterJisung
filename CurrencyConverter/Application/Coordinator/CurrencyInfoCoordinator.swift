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

    func pushCurrencyConverter(with currency: CurrencyDisplay) {
        let currencyConverterViewController = appDIContainer.makeCurrencyConverterViewController(with: currency)
        navigationController.pushViewController(currencyConverterViewController, animated: true)
    }
}
