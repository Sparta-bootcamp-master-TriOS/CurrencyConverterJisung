import DomainLayer

public struct DefaultFetchCurrencyUseCase: FetchCurrencyUseCase {
    private let currencyRepository: CurrencyRepository

    public init(currencyRepository: CurrencyRepository) {
        self.currencyRepository = currencyRepository
    }

    /// 환율 데이터를 가져오는 메서드
    ///
    /// - Parameter completion: 요청 결과를 전달하는 클로저
    public func execute(completion: @escaping (Result<[Currency], Error>) -> Void) {
        currencyRepository.fetchCurrencies(completion: completion)
    }
}
