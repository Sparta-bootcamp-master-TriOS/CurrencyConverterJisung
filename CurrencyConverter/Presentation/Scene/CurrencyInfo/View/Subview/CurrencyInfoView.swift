import SnapKit
import UIKit

final class CurrencyInfoView: UIView {
    private let inset = CurrencyInfoConstant.Separator.edgesInset

    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder _: NSCoder) {
        nil
    }

    private func configureUI() {
        tableView.separatorInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        tableView.register(CurrencyInfoTableViewCell.self, forCellReuseIdentifier: CurrencyInfoTableViewCell.identifier)

        addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
