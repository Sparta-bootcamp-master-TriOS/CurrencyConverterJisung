import DomainLayer

public final class DefaultFetchLatestCurrencyUseCase: FetchLatestCurrencyUseCase {
    private let latestCurrencyRepository: LatestCurrencyRepository

    public init(latestCurrencyRepository: LatestCurrencyRepository) {
        self.latestCurrencyRepository = latestCurrencyRepository
    }

    /// 이전 환율 데이터를 가져오는 메서드
    ///
    /// - Returns: `Currency` 객체 배열, 없을 경우 `nil`
    public func execute() -> [Currency]? {
        latestCurrencyRepository.fetch()
    }
}
