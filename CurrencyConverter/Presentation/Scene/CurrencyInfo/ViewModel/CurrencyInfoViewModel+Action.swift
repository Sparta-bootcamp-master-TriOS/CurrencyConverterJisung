extension CurrencyInfoViewModel {
    enum Action {
        case didFetch
        case didFail(Error)
        case didUpdate
    }
}
