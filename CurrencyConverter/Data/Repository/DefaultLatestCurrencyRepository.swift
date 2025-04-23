import DomainLayer

public final class DefaultLatestCurrencyRepository: LatestCurrencyRepository {
    private let fetchLatestCurrencyDataSource: FetchLatestCurrencyDataSource

    private let mapper = CurrencyMapper.shared

    public init(fetchLatestCurrencyDataSource: FetchLatestCurrencyDataSource) {
        self.fetchLatestCurrencyDataSource = fetchLatestCurrencyDataSource
    }

    /// CoreData에서 이전 환율 데이터를 가져오는 메서드
    ///
    /// - Returns: 이전 환율 데이터를 담은 `[Currency]`. 존재하지 않으면 `nil` 반환.
    public func fetch() -> [Currency]? {
        guard let currencyEntities = fetchLatestCurrencyDataSource.execute() else { return .none }

        let currencies = currencyEntities.map { mapper.map(from: $0) }

        return currencies.map { mapper.map(from: $0) }
    }
}
