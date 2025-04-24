final class RepositoryDIContainer {
    private let dataSourceDIContainer: DataSourceDIContainer

    init(dataSourceDIContainer: DataSourceDIContainer) {
        self.dataSourceDIContainer = dataSourceDIContainer
    }

    func makeCurrencyMapper() -> CurrencyMapper {
        CurrencyMapper()
    }

    func makeCurrencyRepository() -> CurrencyRepository {
        DefaultCurrencyRepository(
            currencyDataSource: dataSourceDIContainer.makeCurrencyDataSource(),
            currencyMapper: makeCurrencyMapper()
        )
    }
}
