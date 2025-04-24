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
