import SnapKit
import UIKit

final class CurrencyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configureUI() {
        text = CurrencyInfoConstant.Label.infoTitle
        textAlignment = .left
        font = .boldSystemFont(ofSize: 32)
    }
}
