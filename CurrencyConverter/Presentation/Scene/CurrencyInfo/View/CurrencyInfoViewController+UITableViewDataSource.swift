import UIKit

extension CurrencyInfoViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        currencyInfoViewModel.currencies.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CurrencyInfoTableViewCell.identifier
        ) as? CurrencyInfoTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(by: currencyInfoViewModel.currencies[indexPath.row])

        return cell
    }
}
