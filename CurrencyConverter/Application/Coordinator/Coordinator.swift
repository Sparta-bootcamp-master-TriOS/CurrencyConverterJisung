import DomainLayer
import UIKit

final class Coordinator {
    var navigationController: UINavigationController
    let diContainer: DIContainer

    init(navigationController: UINavigationController, diContainer: DIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }

    /// 앱 시작 시 초기 화면을 설정하고, 마지막으로 본 화면으로 전환하는 메서드
    ///
    /// `FetchLastSeenSceneUseCase`를 통해 마지막으로 본 화면 정보를 조회하고,
    /// 해당 화면이 `.currencyConverter`일 경우 저장된 통화 코드로 환율 계산기 화면으로 이동한다.
    func start() {
        let currencyInfoViewController = makeCurrencyInfoViewController()

        navigationController.viewControllers = [currencyInfoViewController]

        let fetchLastSeenSceneUseCase = diContainer.makeFetchLastSeenSceneUseCase()

        let lastScene = fetchLastSeenSceneUseCase.execute()

        currencyInfoViewController.onDataReady = { [weak currencyInfoViewController] in
            guard let viewController = currencyInfoViewController,
                  let scene = lastScene?.scene,
                  let code = lastScene?.code,
                  LastSeenScene(rawValue: scene) == .currencyConverter,
                  let currency = viewController.currencyInfoViewModel.displayCurrency(for: code)
            else {
                return
            }

            viewController.delegate?.pushCurrencyConverter(with: currency)
        }
    }
}
