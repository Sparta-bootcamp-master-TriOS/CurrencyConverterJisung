struct DefaultCompareCurrencyUseCase: CompareCurrencyUseCase {
    func compare(base: Double, target: Double) -> Bool? {
        abs(base - target) > 0.01 ? (base > target) : .none
    }
}
