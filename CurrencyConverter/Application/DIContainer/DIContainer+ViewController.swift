import PresentationLayer

extension DIContainer {
    /// CurrencyInfoViewController 생성
    func makeCurrencyInfoViewController() -> CurrencyInfoViewController {
        CurrencyInfoViewController(currencyInfoViewModel: makeCurrencyInfoViewModel())
    }

    /// CurrencyConverterViewController 생성
    func makeCurrencyConverterViewController(with currency: CurrencyDisplay) -> CurrencyConverterViewController {
        CurrencyConverterViewController(currencyConverterViewModel: makeCurrencyConverterViewModel(with: currency))
    }
}
