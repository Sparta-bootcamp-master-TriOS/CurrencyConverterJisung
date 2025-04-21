import DomainLayer

public final class CurrencyInfoViewModel: ViewModelProtocol {
    private let fetchAndCompareCurrencyUseCase: FetchAndCompareCurrencyUseCase
    private let fetchFavoriteUseCase: FetchFavoriteUseCase
    private let saveFavoriteUseCase: SaveFavoriteUseCase
    private let saveLastSeenSceneUseCase: SaveLastSeenSceneUseCase

    private let mapper = CurrencyDisplayMapper()

    var action: ((Action) -> Void)?
    private(set) var state = State(currencies: [], filteredCurrencies: [])

    public init(
        fetchAndCompareCurrencyUseCase: FetchAndCompareCurrencyUseCase,
        fetchFavoriteUseCase: FetchFavoriteUseCase,
        saveFavoriteUseCase: SaveFavoriteUseCase,
        saveLastSeenSceneUseCase: SaveLastSeenSceneUseCase
    ) {
        self.fetchAndCompareCurrencyUseCase = fetchAndCompareCurrencyUseCase
        self.fetchFavoriteUseCase = fetchFavoriteUseCase
        self.saveFavoriteUseCase = saveFavoriteUseCase
        self.saveLastSeenSceneUseCase = saveLastSeenSceneUseCase
    }

    func viewDidAppear() {
        saveLastSeenSceneUseCase.execute(scene: LastSeenScene.currencyInfo.rawValue, code: .none)
    }

    /// 환율 데이터를 요청하고, 정렬 및 필터링을 적용한 후 업데이트 콜백을 호출하는 메서드
    func fetchCurrencies() {
        fetchAndCompareCurrencyUseCase.execute { [weak self] result in
            guard let self else { return }

            switch result {
            case let .success(entities):
                let favoriates = self.fetchFavorites()

                let currencies = entities.map { self.mapper.map(from: $0, favoriates?[$0.code]) }
                self.state.currencies = self.sorted(currencies)
                self.state.filteredCurrencies = self.state.currencies

                self.action?(.didFetch)
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
            state.filteredCurrencies = state.currencies
        } else {
            state.filteredCurrencies = state.currencies.filter {
                $0.code.contains(keyword.uppercased()) || $0.name.contains(keyword)
            }
        }

        action?(.didFetch)
    }

    /// 선택된 환율의 즐겨찾기 상태를 토글하는 메서드
    ///
    /// - Parameter index: 즐겨찾기 상태를 토글할 `filteredCurrencies`의 인덱스.
    func toggleFavorite(at index: Int) {
        let code = state.filteredCurrencies[index].code

        state.filteredCurrencies[index].isFavorite.toggle()

        if let index = state.currencies.firstIndex(where: { $0.code == code }) {
            state.currencies[index].isFavorite.toggle()
        }

        state.filteredCurrencies = sorted(state.filteredCurrencies)
        state.currencies = sorted(state.currencies)

        saveFavoriteUseCase.execute(by: code)

        action?(.didUpdate)
    }

    public func displayCurrency(for code: String) -> CurrencyDisplay? {
        return state.filteredCurrencies.first(where: { $0.code == code })
    }

    private func fetchFavorites() -> [String: Bool]? {
        fetchFavoriteUseCase.execute()
    }

    /// 즐겨찾기 상태를 기준으로 환율을 정렬하는 메서드
    ///
    /// 즐겨찾기 기준으로 정렬 후 통화 코드 기준으로 정렬.
    ///
    /// - Parameter currencies: 정렬할 `CurrencyDisplay` 배열
    /// - Returns: 정렬된 통화 배열
    private func sorted(_ currencies: [CurrencyDisplay]) -> [CurrencyDisplay] {
        return currencies.sorted {
            ($0.isFavorite ? 0 : 1, $0.code) < ($1.isFavorite ? 0 : 1, $1.code)
        }
    }
}
