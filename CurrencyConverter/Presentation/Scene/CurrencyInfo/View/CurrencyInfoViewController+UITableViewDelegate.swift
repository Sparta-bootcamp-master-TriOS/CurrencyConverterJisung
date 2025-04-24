import UIKit

extension CurrencyInfoViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        CurrencyInfoConstant.TableView.height
    }
}
