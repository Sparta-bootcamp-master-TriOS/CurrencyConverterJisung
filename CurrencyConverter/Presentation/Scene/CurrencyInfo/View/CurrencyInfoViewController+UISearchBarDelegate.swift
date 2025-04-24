import UIKit

extension CurrencyInfoViewController: UISearchBarDelegate {
    public func searchBar(_: UISearchBar, textDidChange searchText: String) {
        currencyInfoViewModel.filterCurrencies(with: searchText)

        updateUIAfterFiltering()
    }
}
