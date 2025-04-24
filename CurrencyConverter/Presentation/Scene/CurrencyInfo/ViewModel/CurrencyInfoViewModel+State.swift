extension CurrencyInfoViewModel {
    struct State {
        var currencies: [CurrencyDisplay]
        var filteredCurrencies: [CurrencyDisplay]
        var latestCurrencies: [CurrencyDisplay]?
    }
}
