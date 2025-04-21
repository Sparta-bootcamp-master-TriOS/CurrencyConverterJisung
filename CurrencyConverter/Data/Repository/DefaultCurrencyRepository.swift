import CoreData
import DomainLayer

public final class DefaultCurrencyRepository: CurrencyRepository {
    private let fetchCurrencyDataSource: FetchCurrencyDataSource
    private let fetchLatestCurrencyDataSource: FetchLatestCurrencyDataSource
    private let saveCurrencyDataSource: SaveCurrencyDataSource
    private let fetchFavoriteDataSource: FetchFavoriteDataSource
    private let saveFavoriteDataSource: SaveFavoriteDataSource
    private let fetchLastSeenSceneDataSource: FetchLastSeenSceneDataSource
    private let saveLastSeenSceneDataSource: SaveLastSeenSceneDataSource

    private let mapper = CurrencyMapper()

    private var cachedCurrencyMeta: CurrencyMeta?
    private var cachedCurrencies: [Currency]?

    public init(
        fetchCurrencyDataSource: FetchCurrencyDataSource,
        fetchLatestCurrencyDataSource: FetchLatestCurrencyDataSource,
        saveCurrencyDataSource: SaveCurrencyDataSource,
        fetchFavoriteDataSource: FetchFavoriteDataSource,
        saveFavoriteDataSource: SaveFavoriteDataSource,
        fetchLastSeenSceneDataSource: FetchLastSeenSceneDataSource,
        saveLastSeenSceneDataSource: SaveLastSeenSceneDataSource
    ) {
        self.fetchCurrencyDataSource = fetchCurrencyDataSource
        self.fetchLatestCurrencyDataSource = fetchLatestCurrencyDataSource
        self.saveCurrencyDataSource = saveCurrencyDataSource
        self.fetchFavoriteDataSource = fetchFavoriteDataSource
        self.saveFavoriteDataSource = saveFavoriteDataSource
        self.fetchLastSeenSceneDataSource = fetchLastSeenSceneDataSource
        self.saveLastSeenSceneDataSource = saveLastSeenSceneDataSource
    }

    /// 서버에서 최신 환율 데이터를 가져오는 메서드
    ///
    /// - Parameter completion: 결과를 반환하는 클로저. 성공 시 `[Currency]`를 반환하고 실패 시 `Error`를 반환한다.
    public func fetchCurrencies(completion: @escaping (Result<[Currency], Error>) -> Void) {
        fetchCurrencyDataSource.fetchCurrencies { [weak self] (result: Result<CurrencyResponse, Error>) in
            guard let self else { return }
            switch result {
            case let .success(response):
                let (meta, currencies) = self.mapper.map(from: response)

                self.cachedCurrencyMeta = meta
                self.cachedCurrencies = currencies

                self.saveCurrencies(currencies, meta)

                completion(.success(currencies))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    /// 메모리 캐시된 환율에서 특정 통화 코드에 해당하는 환율 데이터를 반환하는 메서드
    ///
    /// - Parameter code: 통화 코드 (예: "USD", "KRW")
    /// - Returns: 해당 코드에 맞는 `Currency` 객체. 존재하지 않으면 `nil` 반환.
    public func currency(by code: String) -> Currency? {
        cachedCurrencies?.first(where: { $0.code == code })
    }

    /// CoreData에서 이전 환율 데이터를 가져오는 메서드
    ///
    /// - Returns: 이전 환율 데이터를 담은 `[Currency]`. 존재하지 않으면 `nil` 반환.
    public func fetchLatestCurrencies() -> [Currency]? {
        guard let latestMeta = fetchLatestCurrencyDataSource.fetchLatestMeta(),
              let currencyEntities = fetchLatestCurrencyDataSource.fetchCurrencies(meta: latestMeta)
        else {
            return .none
        }

        let currencies = currencyEntities.map { mapper.map(from: $0) }

        return currencies.map { mapper.map(from: $0) }
    }

    /// CoreData에서 즐겨찾기 정보를 가져오는 메서드
    ///
    /// - Returns: 즐겨찾기 목록. 존재하지 않으면 `nil` 반환
    public func fetchFavorites() -> [Favorite]? {
        guard let favorites = fetchFavoriteDataSource.fetchFavorites() else { return .none }

        return favorites.map { mapper.map(from: $0) }
    }

    /// 통화 코드를 기준으로 즐겨찾기 여부를 저장하는 메서드.
    ///
    /// - Parameter code: 즐겨찾기에 추가할 통화 코드
    public func saveFavorite(by code: String) {
        saveFavoriteDataSource.saveFavorite(by: code)
    }

    /// 사용자가 마지막으로 본 화면 정보를 가져오는 메서드
    ///
    /// - Returns: 마지막으로 본 화면의 이름과 선택된 통화 코드의 튜플. 값이 없으면 `nil`
    public func fetchLastSeen() -> (scene: String, code: String?)? {
        guard let lastSeen = fetchLastSeenSceneDataSource.fetchLastSeen() else {
            return .none
        }

        return (lastSeen.scene, lastSeen.selectedCureencyCode)
    }

    /// 사용자가 마지막으로 본 화면 정보를 저장하는 메서드
    ///
    /// - Parameters:
    ///   - scene: 저장할 화면의 이름
    ///   - code: 선택된 통화 코드 (옵셔널)
    public func saveLastSeen(scene: String, code: String?) {
        saveLastSeenSceneDataSource.saveLastSeen(scene: scene, code: code)
    }

    /// CoreData에 최신 환율 데이터를 저장하는 메서드
    ///
    /// - Parameters:
    ///   - currencies: 환율 목록
    ///   - meta: 환율 메타 정보
    private func saveCurrencies(_ currencies: [Currency], _ meta: CurrencyMeta) {
        let currencyEntities = currencies.map { mapper.map(from: $0) }

        saveCurrencyDataSource.saveCurrencies(currencies: currencyEntities, meta: meta)
    }
}
