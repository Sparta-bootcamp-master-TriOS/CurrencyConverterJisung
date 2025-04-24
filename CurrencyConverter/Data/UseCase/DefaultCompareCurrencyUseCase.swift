struct DefaultCompareCurrencyUseCase: CompareCurrencyUseCase {
    /// 최신 환율과 이전 환율의 차이를 비교하여 변동 여부를 판단하는 메서드
    ///
    /// - Parameters:
    ///   - base: 최신 환율
    ///   - target: 이전 환율
    /// - Returns: 기준 환율이 더 크면 `true`, 더 작으면 `false`, 차이가 0.01 이하이면 `nil` (변동 없음)
    func execute(base: Double, target: Double) -> Bool? {
        abs(base - target) > 0.01 ? (base > target) : .none
    }
}
