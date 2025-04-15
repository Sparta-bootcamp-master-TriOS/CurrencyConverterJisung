import SnapKit
import UIKit

final class CurrencyInfoView: UIView {
    private let horizontal = CurrencyInfoConstant.Separator.horizontalInset
    private let vertical = CurrencyInfoConstant.Separator.verticalInset

    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    private func configureUI() {
        tableView.separatorInset = UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
        tableView.register(CurrencyInfoTableViewCell.self, forCellReuseIdentifier: CurrencyInfoTableViewCell.identifier)

        addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
