struct CurrencyDisplayMapper {
    /// `Currency` 엔티티를 화면 표시용 모델인 `CurrencyDisplay`로 매핑하는 메서드
    ///
    /// - Parameter entity: 매핑 대상이 되는 `Currency` 모델.
    /// - Returns: 포맷팅된 환율 문자열을 포함하는 `CurrencyDisplay` 인스턴스.
    func map(from entity: Currency) -> CurrencyDisplay {
        CurrencyDisplay(
            code: entity.code,
            name: entity.name,
            rate: String(format: CurrencyInfoConstant.TableView.rateFormat, entity.rate),
            isFavorite: false
        )
    }
}
