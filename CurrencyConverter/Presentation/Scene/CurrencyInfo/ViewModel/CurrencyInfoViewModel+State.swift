extension CurrencyInfoViewModel {
    struct State {
        var meta: CurrencyMeta?
        var currencies: [CurrencyDisplay]
        var filteredCurrencies: [CurrencyDisplay]
    }
}
