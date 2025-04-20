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

    func execute(completion: @escaping (Result<[Currency], Error>) -> Void) {
        fetchCurrencyUseCase.fetchCurrencies { result in
            guard let targetCurrencies = fetchLatestCurrencyUseCase.fetchLatestCurrencies() else {
                completion(result)

                return
            }

            switch result {
            case let .success(baseCurrencies):
                let targets = Dictionary(uniqueKeysWithValues: targetCurrencies.map { ($0.code, $0) })

                let currencies: [Currency] = baseCurrencies.compactMap { base in
                    guard let target = targets[base.code] else { return .none }

                    let result = compareCurrencyUseCase.compare(base: base.rate, target: target.rate)

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
