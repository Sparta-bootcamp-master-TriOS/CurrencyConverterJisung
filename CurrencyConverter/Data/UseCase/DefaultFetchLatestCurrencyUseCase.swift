struct DefaultFetchLatestCurrencyUseCase: FetchLatestCurrencyUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    /// 이전 환율 데이터를 가져오는 메서드
    ///
    /// - Returns: `Currency` 객체 배열, 없을 경우 `nil`
    func fetchLatestCurrencies() -> [Currency]? {
        currencyRepository.fetchLatestCurrencies()
    }
}
