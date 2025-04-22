# 프로젝트 개요
- 프로젝트명: UI에 데이터 한 스푼 (환율 계산기 앱 프로젝트)
- 개발 기간: 2025.04.14 ~ 2025.04.23
- 사용 기술: Swift, UIKit, SnapKit, Alamofire
- 주요 학습 목표: UIKit, SnapKit, Alamofire, MVVM, Clean Architecture, DI Container, Coordinater

# 프로젝트 구조
```
CurrencyConverter/
├── Application/
│   ├── Coordinator/
│   │   ├── AppCoordinator.swift
│   │   └── CurrencyInfoCoordinator.swift
│   ├── DIContainer/
│   │   ├── AppDIContainer.swift
│   │   ├── DataSourceDIContainer.swift
│   │   ├── RepositoryDIContainer.swift
│   │   └── UseCaseDIContainer.swift
│   ├── AppConstant.swift
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Data/
│   ├── Mapper/
│   │   ├── CurrencyMapper.swift
│   │   └── MapperConstant.swift
│   ├── Model/
│   │   ├── CoreData
│   │   │   ├── CurrencyConverter.xcdatamodeld
│   │   │   ├── CurrencyEntity+CoreDataClass.swift
│   │   │   ├── CurrencyEntity+CoreDataProperties.swift
│   │   │   ├── CurrencyMetaEntity+CoreDataClass.swift
│   │   │   ├── CurrencyMetaEntity+CoreDataProperties.swift
│   │   │   ├── FavoriteEntity+CoreDataClass.swift
│   │   │   ├── FavoriteEntity+CoreDataProperties.swift
│   │   │   ├── LastSeenSceneInfoEntity+CoreDataClass.swift
│   │   │   └── LastSeenSceneInfoEntity+CoreDataProperties.swift
│   │   ├── CurrencyEntityResponse.swift
│   │   └── CurrencyResponse.swift
│   ├── Repository/
│   │   └── DefaultCurrencyRepository.swift
│   ├── Source/
│   │   ├── Local/
│   │   │   ├── FetchFavoriteDataSource.swift
│   │   │   ├── FetchLastSeenSceneDataSource.swift
│   │   │   ├── FetchLatestCurrencyDataSource.swift
│   │   │   ├── PersistenceController.swift
│   │   │   ├── SaveCurrencyDataSource.swift
│   │   │   ├── SaveFavoriteDataSource.swift
│   │   │   └── SaveLastSeenSceneDataSource.swift
│   │   ├── Remote/
│   │   │   └── FetchCurrencyDataSource.swift
│   │   └── SourceConstant.swift
│   ├── UseCase/
│   │   ├── DefaultCompareCurrencyUseCase.swift
│   │   ├── DefaultConvertCurrencyUseCase.swift
│   │   ├── DefaultFetchAndCompareCurrencyUseCase.swift
│   │   ├── DefaultFetchCurrencyUseCase.swift
│   │   ├── DefaultFetchFavoriteUseCase.swift
│   │   ├── DefaultFetchLastSeenSceneUseCase.swift
│   │   ├── DefaultFetchLatestCurrencyUseCase.swift
│   │   ├── DefaultSaveFavoriteUseCase.swift
│   │   └── DefaultSaveLastSeenSceneUseCase.swift
├── Domain/
│   ├── Entity/
│   │   ├── Currency.swift
│   │   ├── CurrencyMeta.swift
│   │   └── Favorite.swift
│   ├── Repository/
│   │   └── CurrencyRepository.swift
│   └── UseCase/
│   │   ├── CompareCurrencyUseCase.swift
│   │   ├── ConvertCurrencyUseCase.swift
│   │   ├── FetchAndCompareCurrencyUseCase.swift
│   │   ├── FetchCurrencyUseCase.swift
│   │   ├── FetchFavoriteUseCase.swift
│   │   ├── FetchLastSeenSceneUseCase.swift
│   │   ├── FetchLatestCurrencyUseCase.swift
│   │   ├── SaveFavoriteUseCase.swift
│   │   └── SaveLastSeenSceneUseCase.swift
├── Presentation/
│   ├── Mapper/
│   │   └── CurrencyDisplayMapper.swift
│   ├── Model/
│   │   ├── CurrencyDisplay.swift
│   │   ├── LastSeenScene.swift
│   │   └── LastSeenSceneInfo.swift
│   └── Scene/
│       ├── CurrencyConverter/
│       │   ├── View/
│       │   │   ├── SubView/
│       │   │   │   ├── AmountTextField.swift
│       │   │   │   ├── ConvertButton.swift
│       │   │   │   ├── CurrencyStackView.swift
│       │   │   │   └── ResultLabel.swift
│       │   │   └── CurrencyConverterViewController.swift
│       │   ├── ViewModel/
│       │   │   ├── CurrencyConverterViewModel.swift
│       │   │   ├── CurrencyConverterViewModel+Action.swift
│       │   │   ├── CurrencyConverterViewModel+ConvertError.swift
│       │   │   └── CurrencyConverterViewModel+State.swift
│       │   └── CurrencyConverterConstant.swift
│       ├── CurrencyInfo/
│       │   ├── View/
│       │   │   ├── SubView/
│       │   │   │   ├── CurrencyInfoTableViewCell.swift
│       │   │   │   ├── CurrencyInfoView.swift
│       │   │   │   ├── CurrencySearchBar.swift
│       │   │   │   └── NoFilteredCurrenciesLabel.swift
│       │   │   ├── CurrencyInfoViewController.swift
│       │   │   ├── CurrencyInfoViewController+UISearchBarDelegate.swift
│       │   │   ├── CurrencyInfoViewController+UITableViewDataSource.swift
│       │   │   └── CurrencyInfoViewController+UITableViewDelegate.swift
│       │   ├── ViewModel/
│       │   │   ├── CurrencyInfoViewModel.swift
│       │   │   ├── CurrencyInfoViewModel+Action.swift
│       │   │   └── CurrencyInfoViewModel+State.swift
│       │   └── CurrencyInfoConstant.swift
│       └── Shared/
│           ├── Alert/
│           │   ├── AlertConstant.swift
│           │   └── AlertManager.swift
│           ├── SubView/
│           │   └── TitleLabel.swift
│           ├── Util/
│           │   └── ReuseIdentifier.swift
│           └── ViewModel/
│               └── ViewModelProtocol.swift
└── Resource/
    ├── Assets.xcassets
    ├── Info.plist
    └── LaunchScreen.storyboard
```

# UI 디버깅
오토레이아웃이 정상적으로 작동하는지 검증하기 위해 Debug Area(콘솔 로그)와 View Debugger를 사용하였다.

1. Debug Aera(콘솔 로그) 확인
   - 앱 실행 시, 콘솔에서 오토레이아웃 관련 경고 메시지 출력 없음
2. View Debugger로 구조 확인
   - Debug -> View Debugging -> Capture View Hierarchy 사용
   - UILabel, UIImageView 등의 컴포넌트 등이 올바르게 배치되어 있고, Superview와의 제약도 정상적으로 설정되어 있음을 확인

# 메모리 이슈 디버깅
Presentation Layer에서 MVVM 기반으로 ViewModel과 ViewController간 바인딩에 클로저를 사용하고 있기 때문에,  
클로저의 강한 참조로 인한 Retain Cycle 및 메모리 누수 발생 가능성을 Memory Graph Debugger를 사용해 점검하였다.

1. 환율 계산기 화면 진입 후 `pop` 시점에서 Memory Graph Debugger를 통해 해당 ViewController 및 ViewModel, 내부 객체 등이 모두 **정상적으로 해제**되는 것을 확인함
2. 앱의 Root ViewController인 환율 정보 화면은 앱 종료 전까지 해제되지 않는 것이 정상이므로, ViewModel 및 내부 데이터에서 불필요한 강한 참조가 **존재하지 않음**을 확인함
3. Instruments, Zombie Objects는 누수가 발견되지 않아 별도 사용하지 않음

# 트러블 슈팅
1. 환율 정보 뷰컨트롤러에서 coordinator를 직접 참조하다가 delegate 패턴으로 수정 후 화면 전환이 되지 않는 문제
   - 문제 상황: 아래 처럼 `CurrencyInfoCoordinator`를 `CurrencyInfoViewController`의 delegate로 설정했음에도 delegate가 `nil`이 되어 화면 전환이 되지 않음
     ```swift
     public final class CurrencyInfoViewController: UIViewController {
         ...
         public weak var delegate: CurrencyInfoViewControllerDelegate?
         ...
     }

     final class CurrencyInfoCoordinator: CurrencyInfoViewControllerDelegate {
         ...
         func makeCurrencyInfoViewController() -> CurrencyInfoViewController {
             let currencyInfoViewController = appDIContainer.makeCurrencyInfoViewController()
             currencyInfoViewController.delegate = self

             return currencyInfoViewController
         }
         ...
     }
     ```
   - 원인 추론:
     1. `CurrencyInfoViewController.viewDidLoad()`에서 delegate가 `nil`이 출력됨
     2. ARC에 의한 해제 가능성 의심
     3. 아래 처럼 `CurrencyInfoCoordinator`가 `AppCoordinator`의 `start()` 메서드의 지역 변수로만 생성되어 강한 참조로 어디에도 보관되지 않음
        ```swift
        final class AppCoordinator {
            ...
            func start() {
                let coordinator = CurrencyInfoCoordinator(
                    navigationController: navigationController,
                    appDIContainer: appDIContainer
                )
                ...
            }
            ...
        }
        ```
     4. `CurrencyInfoViewController`의 delegate는 약한 참조로 강한 참조가 없어 자동으로 해제됨
   - 해결 방안: `AppCoordinator`의 프로퍼티로 `CurrencyInfoCoordinator`를 보관하여 참조 유지
     ```swift
     final class AppCoordinator {
         private var currencyInfoCoordinator: CurrencyInfoCoordinator?

         func start() {
             let coordinator = CurrencyInfoCoordinator(...)
             currencyInfoCoordinator = coordinator
             ...
         }
         ...
     }
     ```
   - 결과 확인: delegate에 참조가 유지되어 정상적으로 화면이 전환됨

2. 환율 목록 화면에서 검색어를 입력(수정)하면 CoreData에 저장된 환율 계산기 화면으로 전환되는 문제
   - 문제 상황: 아래 처럼 앱 실행 시 뷰모델의 `.didFetch`가 발생하면, `onDataReady` 클로저를 호출하도록 하였으나, 검색어가 변경될 때마다 `onDataReady`가 호출되고 있음
     ```swift
     public final class CurrencyInfoViewController: UIViewController {
         ...
         public var onDataReady: (() -> Void)?

         private func configureBindings() {
             currencyInfoViewModel.action = { [weak self] action in
                 DispatchQueue.main.async {
                     switch action {
                     case .didFetch:
                         self?.tableView.reloadData()
                         self?.onDataReady?()
                     case .didFail:
                         self?.showErrorAlert()
                     case .didUpdate:
                         self?.tableView.reloadData()
                     }
                 }
             }
         }
         ...
     }
     
     final class AppCoordinator {
         ...
         func start() {
             ...
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
         ...
     }
     ```
   - 원인 추론:
     1. `onDataReady`는 초기 데이터 로드 후 한 번만 실행되어야 하나, 의도와 다르게 여러번 호출되고 있음
     2. `didFetch`는 초기 데이터 로드 시 한 번만 발생해야 하나, 아래처럼 검색어 필터링에서도 발생하고 있음
        ```swift
            public final class CurrencyInfoViewModel: ViewModelProtocol {
                ...
                func filterCurrencies(with keyword: String) {
                    if keyword.isEmpty {
                        state.filteredCurrencies = state.currencies
                    } else {
                        state.filteredCurrencies = state.currencies.filter {
                            $0.code.contains(keyword.uppercased()) || $0.name.contains(keyword)
                        }
                    }
            
                    action?(.didFetch)
                }
                ...
            }
        ```
     2. 필터링 메서드의 `.didFetch`를 `.didUpdate`로 수정
        ```swift
            public final class CurrencyInfoViewModel: ViewModelProtocol {
                ...
                func filterCurrencies(with keyword: String) {
                    ...
                    action?(.didUpdate)
                }
                ...
            }
        ```
     4. `onDataReady` 클로저를 해제하는 방어 코드도 추가함
     ```swift
     public final class CurrencyInfoViewController: UIViewController {
         ...
         public var onDataReady: (() -> Void)?

         private func configureBindings() {
             currencyInfoViewModel.action = { [weak self] action in
                 DispatchQueue.main.async {
                     switch action {
                     case .didFetch:
                         self?.tableView.reloadData()
                         self?.onDataReady?()
                         self?.onDataReady = nil  // 추가
                     case .didFail:
                         self?.showErrorAlert()
                     case .didUpdate:
                         self?.tableView.reloadData()
                     }
                 }
             }
         }
         ...
     }
     ```
   - 결과 확인: 검색어를 수정해도 화면 전환이 되지 않고, 정상적으로 필터링 됨

# 배운 점
1. 뷰모델을 Protocol을 채택하여 구현하는 것  
   - 뷰모델의 액션과 상태를 분리하고, View는 이를 구독만 하도록 구성했는데, 앞으로 굉장히 많이 사용할 것 같다.  
2. 메모리 누수를 확인하는 방법  
   - 실제로 툴을 사용해보는 것은 처음인데, 누수가 발생하지 않아서 조금 아쉬웠다.  
3. Clean Architecture  
   - 이전에는 대충 디렉토리 구조만 따라했다면, 이번에는 의존성 규칙을 확실히 지키려고 노력했다.  
   - 역시나 간단한 앱이 너무 복잡해지긴 했지만, 그래도 이런 습관을 들이면 좋을 것 같다.  
4. Coordinator 패턴  
   - ViewController에서 직접 화면 전환을 처리하지 않고, Coordinator가 담당함으로써 화면 흐름의 책임을 분리했다.  
   - 사실 화면이 2개뿐이라 크게 의미는 없지만 상대적으로 간단한 앱에 미리 연습해볼 수 있었다.  
5. Target 설정으로 의존성 부여하기
   - 이전에는 육안으로 의존성 규칙을 지키려고 노력했어야 했는데, Target 설정으로 의존성 부여하니 확실히 어떤 부분이 잘못되었는지 확인할 수 있어서 좋았다.
