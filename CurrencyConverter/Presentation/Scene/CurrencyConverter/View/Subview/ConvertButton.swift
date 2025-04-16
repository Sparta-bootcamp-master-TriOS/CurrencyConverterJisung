import UIKit

final class ConvertButton: UIButton {
    typealias Const = CurrencyConverterConstant

    var onButtonTapped: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureUI() {
        backgroundColor = .button
        tintColor = .text
        setTitle(Const.Button.title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: Const.Button.titleFontSize, weight: .medium)
        layer.cornerRadius = Const.Button.cornerRadius

        addTarget(self, action: #selector(buttonTapped), for: .touchDown)
    }

    @objc
    private func buttonTapped() {
        onButtonTapped?()
    }
}
