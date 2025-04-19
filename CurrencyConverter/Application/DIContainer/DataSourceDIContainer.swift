import CoreData

final class DataSourceDIContainer {
    private let persistenceController: PersistenceController
    private let baseURL: String

    init(persistenceController: PersistenceController, baseURL: String) {
        self.persistenceController = persistenceController
        self.baseURL = baseURL
    }

    /// CurrencyDataSource 생성
    func makeFetchCurrencyDataSource() -> FetchCurrencyDataSource {
        FetchCurrencyDataSource(baseURL: baseURL)
    }

    func makeFetchLatestCurrencyDataSource() -> FetchLatestCurrencyDataSource {
        FetchLatestCurrencyDataSource(persistenceController: persistenceController)
    }

    func makeSaveCurrencyDataSource() -> SaveCurrencyDataSource {
        SaveCurrencyDataSource(persistenceController: persistenceController)
    }

    func makeFetchFavoriteDataSource() -> FetchFavoriteDataSource {
        FetchFavoriteDataSource(persistenceController: persistenceController)
    }

    func makeSaveFavoriteDataSource() -> SaveFavoriteDataSource {
        SaveFavoriteDataSource(persistenceController: persistenceController)
    }
}
