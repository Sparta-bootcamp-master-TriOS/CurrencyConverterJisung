import UIKit

final class CurrencySearchBar: UISearchBar {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureUI() {
        searchBarStyle = .minimal
    }
}
