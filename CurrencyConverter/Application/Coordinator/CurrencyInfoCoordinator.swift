import UIKit

final class CurrencyInfoCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer

    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    /// CurrencyInfoViewController 생성
    func makeCurrencyInfoViewController() -> UIViewController {
        let currencyInfoViewController = appDIContainer.makeCurrencyInfoViewController()
        currencyInfoViewController.coordinator = self

        return currencyInfoViewController
    }

    /// 특정 환율 정보를 기반으로 환율 계산기 화면 이동
    ///
    /// - Parameter currency: 선택된 환율 정보
    func pushCurrencyConverter(with currency: CurrencyDisplay) {
        let currencyConverterViewController = appDIContainer.makeCurrencyConverterViewController(with: currency)
        navigationController.pushViewController(currencyConverterViewController, animated: true)
    }
}
