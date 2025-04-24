import UIKit

final class ResultLabel: UILabel {
    typealias Const = CurrencyConverterConstant

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureUI() {
        text = Const.Label.noConvertResult
        font = .systemFont(ofSize: Const.Label.resultFontSize, weight: .medium)
        textAlignment = .center
        numberOfLines = Const.Label.numberOfLines
    }

    func updateUI(result: String) {
        text = result
    }
}
