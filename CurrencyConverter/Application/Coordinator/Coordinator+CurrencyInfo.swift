import PresentationLayer
import UIKit

extension Coordinator: CurrencyInfoViewControllerDelegate {
    /// CurrencyInfoViewController 생성
    func makeCurrencyInfoViewController() -> CurrencyInfoViewController {
        let currencyInfoViewController = diContainer.makeCurrencyInfoViewController()
        currencyInfoViewController.delegate = self

        return currencyInfoViewController
    }

    /// 특정 환율 정보를 기반으로 환율 계산기 화면 이동
    ///
    /// - Parameter currency: 선택된 환율 정보
    func pushCurrencyConverter(with currency: CurrencyDisplay) {
        let currencyConverterViewController = diContainer.makeCurrencyConverterViewController(with: currency)
        navigationController.pushViewController(currencyConverterViewController, animated: true)
    }
}
