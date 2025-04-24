final class DataSourceDIContainer {
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    /// CurrencyDataSource 생성
    func makeCurrencyDataSource() -> CurrencyDataSource {
        return DefaultCurrencyDataSource(baseURL: baseURL)
    }
}
