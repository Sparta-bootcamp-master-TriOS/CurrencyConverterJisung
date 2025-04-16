struct DefaultConvertCurrencyUseCase: ConvertCurrencyUseCase {
    func convert(amount: Double, rate: Double) -> Double {
        amount * rate
    }
}
