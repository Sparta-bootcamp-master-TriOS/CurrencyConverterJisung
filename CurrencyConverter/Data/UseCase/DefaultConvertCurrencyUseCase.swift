struct DefaultConvertCurrencyUseCase: ConvertCurrencyUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    /// 주어진 통화 코드와 금액을 기준으로 환산된 값을 계산하는 메서드
    ///
    /// - Parameters:
    ///   - code: 환산 대상이 되는 통화 코드 (예: "USD").
    ///   - amount: 기준 금액.
    /// - Returns: 환율을 적용한 금액. 통화 코드가 유효하지 않으면 `nil` 반환.
    func execute(code: String, amount: Double) -> Double? {
        guard let currency = currencyRepository.currency(by: code) else {
            return .none
        }

        return currency.rate * amount
    }
}
