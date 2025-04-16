import SnapKit
import UIKit

final class CurrencyConverterViewController: UIViewController {
    typealias Const = CurrencyConverterConstant

    private let currencyConverterViewModel: CurrencyConverterViewModel

    private let titleLabel = TitleLabel()
    private let currencyStackView = CurrencyStackView()
    private let amountTextField = AmountTextField()
    private let convertButton = ConvertButton()
    private let resultLabel = ResultLabel()

    init(currencyConverterViewModel: CurrencyConverterViewModel) {
        self.currencyConverterViewModel = currencyConverterViewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureBindings()
    }

    private func configureUI() {
        view.backgroundColor = .background

        titleLabel.updateText(Const.Label.converterTitle)

        currencyStackView.updateLabel(to: currencyConverterViewModel.currency)

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

    private func configureBindings() {
        convertButton.onButtonTapped = { [weak self] in
            guard let self else { return }

            guard let inputText = amountTextField.text, !inputText.isEmpty else {
                showErrorAlert(message: Const.Alert.empty)

                return
            }

            guard let result = self.currencyConverterViewModel.convertCurrency(amountText: inputText) else {
                showErrorAlert(message: Const.Alert.noNumber)

                return
            }

            self.resultLabel.updateUI(result: result)
        }
    }

    private func showErrorAlert(message: String) {
        let alert = AlertManager.errorAlert(message: message)
        present(alert, animated: true)
    }
}
