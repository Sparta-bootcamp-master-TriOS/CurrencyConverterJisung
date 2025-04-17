final class CurrencyInfoViewModel: ViewModelProtocol {
    private let fetchCurrencyUseCase: FetchCurrencyUseCase
    private let mapper = CurrencyDisplayMapper()

    private(set) var meta: CurrencyMeta?
    private(set) var currencies: [CurrencyDisplay] = []

    var action: ((Action) -> Void)?
    private(set) var state = State(filteredCurrencies: [])

    init(fetchCurrencyUseCase: FetchCurrencyUseCase) {
        self.fetchCurrencyUseCase = fetchCurrencyUseCase
    }

    /// 환율 데이터를 요청하고, 정렬 및 필터링을 적용한 후 업데이트 콜백을 호출하는 메서드
    func fetchCurrencies() {
        fetchCurrencyUseCase.fetchCurrencies { [weak self] result in
            guard let self else { return }

            switch result {
            case let .success((meta, entities)):
                self.meta = meta

                let currencies = entities
                    .map { self.mapper.map(from: $0) }
                    .sorted { $0.code < $1.code }

                self.currencies = currencies
                self.state.filteredCurrencies = currencies

                self.action?(.didUpdate)
            case let .failure(error):
                self.action?(.didFail(error))
            }
        }
    }

    /// 키워드에 따라 환율 목록을 필터링하는 메서드
    ///
    /// - Parameter keyword: 필터링에 사용할 검색어
    func filterCurrencies(with keyword: String) {
        if keyword.isEmpty {
            state.filteredCurrencies = currencies
        } else {
            state.filteredCurrencies = currencies.filter {
                $0.code.contains(keyword.uppercased()) || $0.name.contains(keyword)
            }
        }

        action?(.didUpdate)
    }
}
