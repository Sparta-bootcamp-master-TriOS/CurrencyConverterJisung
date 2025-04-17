final class RepositoryDIContainer {
    private let dataSourceDIContainer: DataSourceDIContainer

    lazy var defaultCurrencyRepository: CurrencyRepository = DefaultCurrencyRepository(
        currencyDataSource: dataSourceDIContainer.makeCurrencyDataSource()
    )

    init(dataSourceDIContainer: DataSourceDIContainer) {
        self.dataSourceDIContainer = dataSourceDIContainer
    }

    /// CurrencyRepository 생성
    func makeCurrencyRepository() -> CurrencyRepository {
        defaultCurrencyRepository
    }
}
