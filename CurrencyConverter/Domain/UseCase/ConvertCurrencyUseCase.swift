public protocol ConvertCurrencyUseCase {
    func execute(code: String, amount: Double) -> Double?
}
