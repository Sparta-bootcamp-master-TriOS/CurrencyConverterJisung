import SnapKit
import UIKit

final class CurrencyInfoViewController: UIViewController {
    typealias CIC = CurrencyInfoConstant

    let currencyInfoViewModel: CurrencyInfoViewModel

    private let currencyInfoView = CurrencyInfoView()
    private(set) lazy var tableView = currencyInfoView.tableView

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

        [currencyInfoView]
            .forEach { view.addSubview($0) }

        currencyInfoView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide).inset(CIC.TableView.horizontalInset)
        }
    }

    private func configureTableView() {
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
}
