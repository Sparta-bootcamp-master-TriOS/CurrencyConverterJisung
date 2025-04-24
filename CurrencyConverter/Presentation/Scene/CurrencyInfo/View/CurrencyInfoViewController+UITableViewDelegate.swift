import UIKit

extension CurrencyInfoViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        CurrencyInfoConstant.TableView.height
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let currency = currencyInfoViewModel.filteredCurrencies[indexPath.row]

        coordinator?.pushCurrencyConverter(code: currency.code, name: currency.name)
    }
}
