internal import SnapKit
import UIKit

final class CurrencyStackView: UIView {
    typealias Const = CurrencyConverterConstant

    private let codeLabel = UILabel()
    private let nameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureUI() {
        codeLabel.font = .systemFont(ofSize: Const.Label.codeFontSize, weight: .bold)

        nameLabel.font = .systemFont(ofSize: Const.Label.nameFontSize)
        nameLabel.textColor = .secondaryText

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Const.StackView.defaultSpacing
        stackView.alignment = .center

        [codeLabel, nameLabel]
            .forEach { stackView.addArrangedSubview($0) }

        addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func updateLabel(to currency: CurrencyDisplay) {
        codeLabel.text = currency.code
        nameLabel.text = currency.name
    }
}
