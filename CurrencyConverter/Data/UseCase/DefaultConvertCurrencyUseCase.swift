struct DefaultConvertCurrencyUseCase: ConvertCurrencyUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    func convert(code: String, amount: Double) -> Double? {
        guard let currency = currencyRepository.currency(by: code) else {
            return .none
        }

        return currency.rate * amount
    }
}
