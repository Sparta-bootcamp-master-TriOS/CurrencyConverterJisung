struct CurrencyDisplayMapper {
    func map(from entity: Currency) -> CurrencyDisplay {
        CurrencyDisplay(
            code: entity.code,
            name: entity.name,
            rate: String(format: CurrencyInfoConstant.TableView.rateFormat, entity.rate)
        )
    }
}
