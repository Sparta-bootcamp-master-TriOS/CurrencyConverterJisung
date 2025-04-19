struct CurrencyDisplayMapper {
    /// `Currency` 엔티티를 화면 표시용 모델인 `CurrencyDisplay`로 매핑하는 메서드
    ///
    /// - Parameters:
    ///   - currency: 매핑 대상이 되는 `Currency` 모델.
    ///   - isFavorite: 즐겨찾기 여부
    /// - Returns: 포맷팅된 환율 문자열과 즐겨찾기 여부를 포함하는 `CurrencyDisplay` 인스턴스.
    func map(from currency: Currency, _ isFavorite: Bool?) -> CurrencyDisplay {
        CurrencyDisplay(
            code: currency.code,
            name: currency.name,
            rate: String(format: CurrencyInfoConstant.TableView.rateFormat, currency.rate),
            isFavorite: isFavorite ?? false
        )
    }
}
