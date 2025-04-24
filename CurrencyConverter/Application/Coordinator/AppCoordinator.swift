import UIKit

final class AppCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer

    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    /// 앱 실행 시 진입 화면 설정 메서드
    func start() {
        let currencyInfoCoordinator = CurrencyInfoCoordinator(
            navigationController: navigationController,
            appDIContainer: appDIContainer
        )
        let currencyInfoViewController = currencyInfoCoordinator.makeCurrencyInfoViewController()

        navigationController.viewControllers = [currencyInfoViewController]
    }
}
