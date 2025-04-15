final class CurrencyInfoViewModel {
    private let fetchCurrencyUseCase: FetchCurrencyUseCase

    var onUpdate: (() -> Void)?
    var onError: ((Error) -> Void)?

    private(set) var meta: CurrencyMeta?
    private(set) var currencies: [Currency] = []
    private(set) var filteredCurrencies: [Currency] = []

    init(fetchCurrencyUseCase: FetchCurrencyUseCase) {
        self.fetchCurrencyUseCase = fetchCurrencyUseCase
    }

    /// 환율 데이터를 요청하고, 정렬 및 필터링을 적용한 후 업데이트 콜백을 호출하는 메서드
    func fetchCurrencies() {
        fetchCurrencyUseCase.fetchCurrencies { [weak self] result in
            switch result {
            case let .success((meta, currencies)):
                self?.meta = meta

                let sorted = currencies.sorted { $0.code < $1.code }
                self?.currencies = sorted
                self?.filteredCurrencies = sorted

                self?.onUpdate?()
            case let .failure(error):
                self?.onError?(error)
            }
        }
    }

    /// 키워드에 따라 환율 목록을 필터링하는 메서드
    ///
    /// - Parameter keyword: 필터링에 사용할 검색어
    func filterCurrencies(with keyword: String) {
        if keyword.isEmpty {
            filteredCurrencies = currencies
        } else {
            filteredCurrencies = currencies.filter {
                $0.code.contains(keyword.uppercased()) || $0.name.contains(keyword)
            }
        }

        onUpdate?()
    }
}
