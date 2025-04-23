import DomainLayer

public final class DefaultFetchCurrencyUseCase: FetchCurrencyUseCase {
    private let currencyRepository: CurrencyRepository
    private let currencyCacheRepository: CurrencyCacheRepository

    public init(
        currencyRepository: CurrencyRepository,
        currencyCacheRepository: CurrencyCacheRepository
    ) {
        self.currencyRepository = currencyRepository
        self.currencyCacheRepository = currencyCacheRepository
    }

    /// 환율 데이터를 가져오는 메서드
    ///
    /// - Parameter completion: 요청 결과를 전달하는 클로저
    public func execute(completion: @escaping (Result<[Currency], Error>) -> Void) {
        currencyRepository.fetch { [weak self] result in
            switch result {
            case let .success(response):
                self?.currencyCacheRepository.cache(meta: response.meta, currencies: response.currencies)

                completion(.success(response.currencies))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
