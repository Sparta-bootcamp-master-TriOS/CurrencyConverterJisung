import SnapKit
import UIKit

final class CurrencyInfoTableViewCell: UITableViewCell, ReuseIdentifier {
    private let codeLabel = UILabel()
    private let rateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    private func configureUI() {
        codeLabel.textColor = .text
        rateLabel.textColor = .text

        [codeLabel, rateLabel]
            .forEach { contentView.addSubview($0) }

        codeLabel.snp.makeConstraints {
            $0.leading.verticalEdges.equalToSuperview()
        }

        rateLabel.snp.makeConstraints {
            $0.trailing.verticalEdges.equalToSuperview()
        }
    }

    /// 셀 정보 업데이트
    /// 
    /// - Parameter currency: 표시할 환율 데이터
    func updateCell(by currency: Currency) {
        codeLabel.text = currency.code
        rateLabel.text = String(format: CurrencyInfoConstant.TableView.rateFormat, currency.rate)
    }
}
