struct DefaultFetchCurrencyUseCase: FetchCurrencyUseCase {
    private let currencyRepository: CurrencyRepository

    init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    /// 환율 데이터를 가져오는 메서드
    ///
    /// - Parameter completion: 요청 결과를 전달하는 클로저
    func fetchCurrencies(completion: @escaping (Result<(CurrencyMeta, [Currency]), Error>) -> Void) {
        currencyRepository.fetchCurrencies(completion: completion)
    }
}
