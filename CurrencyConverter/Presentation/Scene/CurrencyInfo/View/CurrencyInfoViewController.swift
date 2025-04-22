internal import SnapKit
import UIKit

public final class CurrencyInfoViewController: UIViewController {
    typealias Const = CurrencyInfoConstant.Label

    public weak var delegate: CurrencyInfoViewControllerDelegate?
    public let currencyInfoViewModel: CurrencyInfoViewModel

    public var onDataReady: (() -> Void)?

    private let titleLabel = TitleLabel()
    private let searchBar = CurrencySearchBar()
    private let currencyInfoView = CurrencyInfoView()
    private(set) lazy var tableView = currencyInfoView.tableView
    private let noFilteredCurrencies = NoFilteredCurrenciesLabel()

    public init(currencyInfoViewModel: CurrencyInfoViewModel) {
        self.currencyInfoViewModel = currencyInfoViewModel

        super.init(nibName: nil, bundle: nil)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureTableView()
        configureBindings()
        configureBackButton()
        fetchCurrencies()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    private func configureUI() {
        view.backgroundColor = .background

        titleLabel.updateText(Const.infoTitle)

        [titleLabel, searchBar, currencyInfoView, noFilteredCurrencies]
            .forEach { view.addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(Const.topSpacing)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(Const.defaultSpacing)
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }

        currencyInfoView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }

        noFilteredCurrencies.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    private func configureTableView() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func configureBindings() {
        currencyInfoViewModel.action = { [weak self] action in
            DispatchQueue.main.async {
                switch action {
                case .didFetch:
                    self?.tableView.reloadData()
                    self?.onDataReady?()
                    self?.onDataReady = .none
                case .didFail:
                    self?.showErrorAlert()
                case .didUpdate:
                    self?.tableView.reloadData()
                }
            }
        }
    }

    private func configureBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = Const.infoTitle

        navigationItem.backBarButtonItem = backButton
    }

    private func fetchCurrencies() {
        currencyInfoViewModel.fetchCurrencies()
    }

    private func showErrorAlert() {
        let alert = AlertManager.errorAlert(message: CurrencyInfoConstant.Alert.message)
        present(alert, animated: true)
    }

    func updateUIAfterFiltering() {
        let isEmpty = currencyInfoViewModel.state.filteredCurrencies.isEmpty

        noFilteredCurrencies.isHidden = !isEmpty
        tableView.isHidden = isEmpty
    }
}
