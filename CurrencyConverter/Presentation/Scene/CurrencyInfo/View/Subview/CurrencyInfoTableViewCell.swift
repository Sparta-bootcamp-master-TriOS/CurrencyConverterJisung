internal import SnapKit
import UIKit

final class CurrencyInfoTableViewCell: UITableViewCell, ReuseIdentifier {
    typealias Const = CurrencyInfoConstant.TableView

    var onButtonTapped: (() -> Void)?

    private let codeLabel = UILabel()
    private let nameLabel = UILabel()
    private let rateLabel = UILabel()
    private let compareLabel = UILabel()
    private let favoriteButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    private func configureUI() {
        codeLabel.textColor = .text
        codeLabel.font = .systemFont(ofSize: Const.defaultFontSize, weight: .medium)

        nameLabel.textColor = .secondaryText
        nameLabel.font = .systemFont(ofSize: Const.nameFontSize)

        rateLabel.textColor = .text
        rateLabel.textAlignment = .right
        rateLabel.font = .systemFont(ofSize: Const.defaultFontSize)

        compareLabel.font = .systemFont(ofSize: Const.defaultFontSize)

        let buttonImage = UIImage(
            systemName: Const.star,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: Const.defaultFontSize)
        )
        favoriteButton.setImage(buttonImage, for: .normal)
        favoriteButton.tintColor = .favorite
        favoriteButton.addTarget(self, action: #selector(buttonTapped), for: .touchDown)

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Const.labelStackViewSpacing

        [codeLabel, nameLabel]
            .forEach { stackView.addArrangedSubview($0) }

        [stackView, rateLabel, compareLabel, favoriteButton]
            .forEach { contentView.addSubview($0) }

        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(Const.defaultSpacing)
        }

        rateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(favoriteButton.snp.leading).offset(Const.rateLabelSpacing)
            $0.width.equalTo(Const.rateLabelWidth)
        }

        compareLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(rateLabel.snp.trailing).offset(Const.defaultSpacing)
        }

        favoriteButton.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.trailing.equalToSuperview().inset(Const.defaultSpacing)
        }
    }

    /// 셀 정보 업데이트
    ///
    /// - Parameter currency: 표시할 환율 데이터
    func updateCell(by currency: CurrencyDisplay) {
        codeLabel.text = currency.code
        nameLabel.text = currency.name
        rateLabel.text = currency.rate
        compareLabel.text = currency.compareEmoji

        updateFavoriteButton(by: currency.isFavorite)
    }

    func updateFavoriteButton(by isFavorite: Bool) {
        let buttonImage = UIImage(
            systemName: isFavorite ? Const.starFill : Const.star,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: Const.defaultFontSize)
        )

        favoriteButton.setImage(buttonImage, for: .normal)
    }

    @objc
    private func buttonTapped() {
        onButtonTapped?()
    }
}
