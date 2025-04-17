final class CurrencyConverterViewModel {
    private let convertCurrencyUseCase: ConvertCurrencyUseCase

    private(set) var currency: CurrencyDisplay

    var action: ((Action) -> Void)?
    private(set) var state = State()

    init(convertCurrencyUseCase: ConvertCurrencyUseCase, currency: CurrencyDisplay) {
        self.convertCurrencyUseCase = convertCurrencyUseCase
        self.currency = currency
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

        guard let result = convertCurrencyUseCase.convert(code: currency.code, amount: amount) else {
            return
        }

        let resultText = String(format: CurrencyConverterConstant.Label.resultFormat, result)

        state = State(result: resultText)

        action?(.didUpdate)
    }
}
