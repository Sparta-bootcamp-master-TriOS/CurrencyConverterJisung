final class CurrencyConverterViewModel {
    private let convertCurrencyUseCase: ConvertCurrencyUseCase

    private(set) var currency: Currency

    init(convertCurrencyUseCase: ConvertCurrencyUseCase, currency: Currency) {
        self.convertCurrencyUseCase = convertCurrencyUseCase
        self.currency = currency
    }

    func convertCurrency(amountText: String) -> String? {
        guard let amount = Double(amountText) else { return .none }

        let result = convertCurrencyUseCase.convert(amount: amount, rate: currency.rate)

        return String(format: CurrencyConverterConstant.Label.resultFormat, result)
    }
}
