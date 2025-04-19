import CoreData

final class DefaultCurrencyRepository: CurrencyRepository {
    private let fetchCurrencyDataSource: FetchCurrencyDataSource
    private let fetchLatestCurrencyDataSource: FetchLatestCurrencyDataSource
    private let saveCurrencyDataSource: SaveCurrencyDataSource
    private let fetchFavoriteDataSource: FetchFavoriteDataSource
    private let saveFavoriteDataSource: SaveFavoriteDataSource

    private let mapper = CurrencyMapper()

    private var cachedCurrencyMeta: CurrencyMeta?
    private var cachedCurrencies: [Currency]?

    init(
        fetchCurrencyDataSource: FetchCurrencyDataSource,
        fetchLatestCurrencyDataSource: FetchLatestCurrencyDataSource,
        saveCurrencyDataSource: SaveCurrencyDataSource,
        fetchFavoriteDataSource: FetchFavoriteDataSource,
        saveFavoriteDataSource: SaveFavoriteDataSource
    ) {
        self.fetchCurrencyDataSource = fetchCurrencyDataSource
        self.fetchLatestCurrencyDataSource = fetchLatestCurrencyDataSource
        self.saveCurrencyDataSource = saveCurrencyDataSource
        self.fetchFavoriteDataSource = fetchFavoriteDataSource
        self.saveFavoriteDataSource = saveFavoriteDataSource
    }

    /// 환율 데이터를 서버에서 가져오는 메서드
    ///
    /// - Parameter completion: 요청 결과를 전달하는 클로저. 성공 시 `Currency` 배열을 반환
    func fetchCurrencies(completion: @escaping (Result<[Currency], Error>) -> Void) {
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

    /// 특정 통화 코드에 해당하는 환율 정보를 반환하는 메서드
    ///
    /// - Parameter code: 검색할 통화 코드
    /// - Returns: 해당 코드의 `Currency` 객체, 없으면 `nil`
    func currency(by code: String) -> Currency? {
        cachedCurrencies?.first(where: { $0.code == code })
    }

    func fetchLatestCurrencies() -> [Currency]? {
        guard let latestMeta = fetchLatestCurrencyDataSource.fetchLatestMeta(),
              let currencyEntities = fetchLatestCurrencyDataSource.fetchCurrencies(meta: latestMeta)
        else {
            return .none
        }

        let currencies = currencyEntities.map { mapper.map(from: $0) }

        return currencies.map { mapper.map(from: $0) }
    }

    func fetchFavorites() -> [Favorite]? {
        guard let favorites = fetchFavoriteDataSource.fetchFavorites() else { return .none }

        return favorites.map { mapper.map(from: $0) }
    }

    func saveFavorite(by code: String) {
        saveFavoriteDataSource.saveFavorite(by: code)
    }

    private func saveCurrencies(_ currencies: [Currency], _ meta: CurrencyMeta) {
        let currencyEntities = currencies.map { mapper.map(from: $0) }

        saveCurrencyDataSource.saveCurrencies(currencies: currencyEntities, meta: meta)
    }
}
