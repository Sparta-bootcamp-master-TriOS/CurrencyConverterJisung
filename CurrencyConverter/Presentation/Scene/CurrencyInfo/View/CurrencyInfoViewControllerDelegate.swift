public protocol CurrencyInfoViewControllerDelegate: AnyObject {
    func pushCurrencyConverter(with currency: CurrencyDisplay)
}
