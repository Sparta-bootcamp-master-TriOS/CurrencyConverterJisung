final class DataSourceDIContainer {
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    func makeCurrencyDataSource() -> CurrencyDataSource {
        return DefaultCurrencyDataSource(baseURL: baseURL)
    }
}
