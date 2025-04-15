import SnapKit
import UIKit

final class CurrencyInfoViewController: UIViewController {
    typealias Const = CurrencyInfoConstant.Label

    let currencyInfoViewModel: CurrencyInfoViewModel

    private let titleLabel = CurrencyLabel()
    private let searchBar = CurrencySearchBar()
    private let currencyInfoView = CurrencyInfoView()
    private(set) lazy var tableView = currencyInfoView.tableView
    private let noFilteredCurrencies = NoFilteredCurrenciesLabel()

    init(currencyInfoViewModel: CurrencyInfoViewModel) {
        self.currencyInfoViewModel = currencyInfoViewModel

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureTableView()
        configureBindings()
        fetchCurrencies()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    private func configureUI() {
        view.backgroundColor = .background

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
        currencyInfoViewModel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        currencyInfoViewModel.onError = { [weak self] _ in
            DispatchQueue.main.async {
                self?.showErrorAlert()
            }
        }
    }

    private func fetchCurrencies() {
        currencyInfoViewModel.fetchCurrencies()
    }

    private func showErrorAlert() {
        let alert = AlertManager.errorAlert(message: CurrencyInfoConstant.Alert.message)
        present(alert, animated: true)
    }

    func updateUIAfterFiltering() {
        let isEmpty = currencyInfoViewModel.filteredCurrencies.isEmpty

        noFilteredCurrencies.isHidden = !isEmpty
        tableView.isHidden = isEmpty
    }
}
