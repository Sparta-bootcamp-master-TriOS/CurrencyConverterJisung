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

    /// FetchLatestCurrencyDataSource 생성
    func makeFetchLatestCurrencyDataSource() -> FetchLatestCurrencyDataSource {
        FetchLatestCurrencyDataSource(persistenceController: persistenceController)
    }

    /// SaveCurrencyDataSource 생성
    func makeSaveCurrencyDataSource() -> SaveCurrencyDataSource {
        SaveCurrencyDataSource(persistenceController: persistenceController)
    }

    /// FetchFavoriteDataSource 생성
    func makeFetchFavoriteDataSource() -> FetchFavoriteDataSource {
        FetchFavoriteDataSource(persistenceController: persistenceController)
    }

    /// SaveFavoriteDataSource 생성
    func makeSaveFavoriteDataSource() -> SaveFavoriteDataSource {
        SaveFavoriteDataSource(persistenceController: persistenceController)
    }

    /// FetchLastSeenSceneDataSource 생성
    func makeFetchLastSeenSceneDataSource() -> FetchLastSeenSceneDataSource {
        FetchLastSeenSceneDataSource(persistenceController: persistenceController)
    }

    /// SaveLastSeenSceneDataSource 생성
    func makeSaveLastSeenSceneDataSource() -> SaveLastSeenSceneDataSource {
        SaveLastSeenSceneDataSource(persistenceController: persistenceController)
    }
}
