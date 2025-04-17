final class RepositoryDIContainer {
    private let dataSourceDIContainer: DataSourceDIContainer

    lazy var defaultCurrencyRepository: CurrencyRepository = DefaultCurrencyRepository(
        currencyDataSource: dataSourceDIContainer.makeCurrencyDataSource()
    )

    init(dataSourceDIContainer: DataSourceDIContainer) {
        self.dataSourceDIContainer = dataSourceDIContainer
    }

    func makeCurrencyRepository() -> CurrencyRepository {
        defaultCurrencyRepository
    }
}
