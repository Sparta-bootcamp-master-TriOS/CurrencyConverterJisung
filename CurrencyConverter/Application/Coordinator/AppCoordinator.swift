import UIKit

final class AppCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer

    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let currencyInfoCoordinator = CurrencyInfoCoordinator(
            navigationController: navigationController,
            appDIContainer: appDIContainer
        )
        let currencyInfoViewController = currencyInfoCoordinator.makeCurrencyInfoViewController()

        navigationController.viewControllers = [currencyInfoViewController]
    }
}
