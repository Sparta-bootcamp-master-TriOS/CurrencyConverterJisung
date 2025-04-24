import UIKit

extension CurrencyInfoViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        currencyInfoViewModel.filteredCurrencies.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CurrencyInfoTableViewCell.identifier
        ) as? CurrencyInfoTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(by: currencyInfoViewModel.filteredCurrencies[indexPath.row])

        return cell
    }
}
