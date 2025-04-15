import UIKit

final class NoFilteredCurrenciesLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureUI() {
        text = CurrencyInfoConstant.Label.noFilteredCurrencies
        textColor = .secondaryText
        isHidden = true
    }
}
