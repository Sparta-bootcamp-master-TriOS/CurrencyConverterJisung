import UIKit

final class TitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureUI() {
        textAlignment = .left
        font = .boldSystemFont(ofSize: CurrencyInfoConstant.Label.titleFontSize)
    }

    func updateText(_ text: String) {
        self.text = text
    }
}
