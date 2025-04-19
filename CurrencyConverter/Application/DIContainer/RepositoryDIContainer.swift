final class RepositoryDIContainer {
    private let dataSourceDIContainer: DataSourceDIContainer

    lazy var defaultCurrencyRepository: CurrencyRepository = DefaultCurrencyRepository(
        fetchCurrencyDataSource: dataSourceDIContainer.makeFetchCurrencyDataSource(),
        fetchLatestCurrencyDataSource: dataSourceDIContainer.makeFetchLatestCurrencyDataSource(),
        saveCurrencyDataSource: dataSourceDIContainer.makeSaveCurrencyDataSource(),
        fetchFavoriteDataSource: dataSourceDIContainer.makeFetchFavoriteDataSource(),
        saveFavoriteDataSource: dataSourceDIContainer.makeSaveFavoriteDataSource()
    )

    init(dataSourceDIContainer: DataSourceDIContainer) {
        self.dataSourceDIContainer = dataSourceDIContainer
    }

    /// CurrencyRepository 생성
    func makeCurrencyRepository() -> CurrencyRepository {
        defaultCurrencyRepository
    }
}
