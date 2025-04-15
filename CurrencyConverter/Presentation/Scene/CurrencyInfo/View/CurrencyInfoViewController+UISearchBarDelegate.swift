import UIKit

extension CurrencyInfoViewController: UISearchBarDelegate {
    func searchBar(_: UISearchBar, textDidChange searchText: String) {
        currencyInfoViewModel.filterCurrencies(with: searchText)

        updateUIAfterFiltering()
    }
}
