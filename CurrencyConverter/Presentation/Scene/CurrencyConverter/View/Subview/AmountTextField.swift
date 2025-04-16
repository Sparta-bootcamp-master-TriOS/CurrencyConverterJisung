import UIKit

final class AmountTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureUI() {
        borderStyle = .roundedRect
        keyboardType = .decimalPad
        textAlignment = .center
        placeholder = CurrencyConverterConstant.Label.placeholder
    }
}
