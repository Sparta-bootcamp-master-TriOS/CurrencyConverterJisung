public protocol CompareCurrencyUseCase {
    func execute(base: Double, target: Double) -> Bool?
}
