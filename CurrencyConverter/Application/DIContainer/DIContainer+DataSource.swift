import CoreData
import DataLayer

extension DIContainer {
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
