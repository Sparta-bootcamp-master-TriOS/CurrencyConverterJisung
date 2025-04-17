import UIKit

extension CurrencyInfoViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        currencyInfoViewModel.state.filteredCurrencies.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CurrencyInfoTableViewCell.identifier
        ) as? CurrencyInfoTableViewCell else {
            return UITableViewCell()
        }

        cell.updateCell(by: currencyInfoViewModel.state.filteredCurrencies[indexPath.row])

        cell.onButtonTapped = { [weak self] in
            self?.currencyInfoViewModel.toggleFavorite(at: indexPath.row)
        }

        return cell
    }
}
