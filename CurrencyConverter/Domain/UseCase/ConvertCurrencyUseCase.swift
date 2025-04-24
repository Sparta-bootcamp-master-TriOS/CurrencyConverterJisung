protocol ConvertCurrencyUseCase {
    func convert(code: String, amount: Double) -> Double?
}
