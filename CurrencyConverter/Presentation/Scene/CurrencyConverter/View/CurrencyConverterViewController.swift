import SnapKit
import UIKit

final class CurrencyConverterViewController: UIViewController {
    typealias Const = CurrencyConverterConstant

    private let titleLabel = TitleLabel()
    private let currencyStackView = CurrencyStackView()
    private let amountTextField = AmountTextField()
    private let convertButton = ConvertButton()
    private let resultLabel = ResultLabel()

    private let code: String
    private let name: String

    init(code: String, name: String) {
        self.code = code
        self.name = name

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .background

        titleLabel.updateText(Const.Label.converterTitle)

        currencyStackView.updateLabel(to: code, name)

        [titleLabel, currencyStackView, amountTextField, convertButton, resultLabel]
            .forEach { view.addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(Const.Constraint.topSpacing)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(Const.Constraint.defaultSpacing)
        }

        currencyStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Const.Constraint.topSpacing)
            $0.centerX.equalToSuperview()
        }

        amountTextField.snp.makeConstraints {
            $0.top.equalTo(currencyStackView.snp.bottom).offset(Const.Constraint.topSpacing)
            $0.horizontalEdges.equalToSuperview().inset(Const.Constraint.horizontalSpacing)
            $0.height.equalTo(Const.Constraint.buttonAndTextFieldHeight)
        }

        convertButton.snp.makeConstraints {
            $0.top.equalTo(amountTextField.snp.bottom).offset(Const.Constraint.buttonTopSpacing)
            $0.horizontalEdges.equalToSuperview().inset(Const.Constraint.horizontalSpacing)
            $0.height.equalTo(Const.Constraint.buttonAndTextFieldHeight)
        }

        resultLabel.snp.makeConstraints {
            $0.top.equalTo(convertButton.snp.bottom).offset(Const.Constraint.topSpacing)
            $0.horizontalEdges.equalToSuperview().inset(Const.Constraint.horizontalSpacing)
        }
    }
}
