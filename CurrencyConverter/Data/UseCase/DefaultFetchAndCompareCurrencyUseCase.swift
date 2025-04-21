struct DefaultFetchAndCompareCurrencyUseCase: FetchAndCompareCurrencyUseCase {
    private let fetchCurrencyUseCase: FetchCurrencyUseCase
    private let fetchLatestCurrencyUseCase: FetchLatestCurrencyUseCase
    private let compareCurrencyUseCase: CompareCurrencyUseCase

    init(
        fetchCurrencyUseCase: FetchCurrencyUseCase,
        fetchLatestCurrencyUseCase: FetchLatestCurrencyUseCase,
        compareCurrencyUseCase: CompareCurrencyUseCase
    ) {
        self.fetchCurrencyUseCase = fetchCurrencyUseCase
        self.fetchLatestCurrencyUseCase = fetchLatestCurrencyUseCase
        self.compareCurrencyUseCase = compareCurrencyUseCase
    }

    /// 서버에서 환율 데이터를 가져와, 이전 데이터와 비교 후 증감 여부를 포함한 환율 목록을 반환합니다.
    ///
    /// - Parameter completion: 결과 콜백 클로저. 성공 시 `Currency` 배열 반환, 실패 시 `Error` 반환
    func execute(completion: @escaping (Result<[Currency], Error>) -> Void) {
        fetchCurrencyUseCase.execute { result in
            guard let targetCurrencies = fetchLatestCurrencyUseCase.execute() else {
                completion(result)

                return
            }

            switch result {
            case let .success(baseCurrencies):
                let targets = Dictionary(uniqueKeysWithValues: targetCurrencies.map { ($0.code, $0) })

                let currencies: [Currency] = baseCurrencies.compactMap { base in
                    guard let target = targets[base.code] else { return .none }

                    let result = compareCurrencyUseCase.execute(base: base.rate, target: target.rate)

                    return Currency(
                        code: base.code,
                        name: base.name,
                        rate: base.rate,
                        hasIncreased: result
                    )
                }

                completion(.success(currencies))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
