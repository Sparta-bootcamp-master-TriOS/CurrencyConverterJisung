import UIKit

extension CurrencyInfoViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        CurrencyInfoConstant.TableView.height
    }

    func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        coordinator?.pushCurrencyConverter()
    }
}
