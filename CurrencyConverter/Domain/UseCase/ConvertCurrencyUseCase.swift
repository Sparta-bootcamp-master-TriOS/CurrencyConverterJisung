protocol ConvertCurrencyUseCase {
    func convert(amount: Double, rate: Double) -> Double
}
