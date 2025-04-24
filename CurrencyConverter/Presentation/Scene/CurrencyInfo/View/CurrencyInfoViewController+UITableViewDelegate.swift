import UIKit

extension CurrencyInfoViewController: UITableViewDelegate {
    public func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        CurrencyInfoConstant.TableView.height
    }

    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let currency = currencyInfoViewModel.state.filteredCurrencies[indexPath.row]

        delegate?.pushCurrencyConverter(with: currency)
    }
}
