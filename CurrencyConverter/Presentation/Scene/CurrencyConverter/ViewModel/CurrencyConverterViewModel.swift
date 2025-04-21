final class CurrencyConverterViewModel {
    private let convertCurrencyUseCase: ConvertCurrencyUseCase

    var action: ((Action) -> Void)?
    private(set) var state: State

    init(convertCurrencyUseCase: ConvertCurrencyUseCase, currency: CurrencyDisplay) {
        self.convertCurrencyUseCase = convertCurrencyUseCase
        state = State(currency: currency)
    }

    func convertCurrency(amountText: String) {
        guard !amountText.isEmpty else {
            action?(.didFail(ConvertError.empty))

            return
        }

        guard let amount = Double(amountText) else {
            action?(.didFail(ConvertError.noNumber))

            return
        }

        guard let result = convertCurrencyUseCase.execute(code: state.currency.code, amount: amount) else {
            return
        }

        let resultText = String(format: CurrencyConverterConstant.Label.resultFormat, result)

        state.result = resultText

        action?(.didUpdate)
    }
}
