final class CurrencyInfoViewModel {
    private let fetchCurrencyUseCase: FetchCurrencyUseCase

    var onUpdate: (() -> Void)?
    var onError: ((Error) -> Void)?

    private(set) var meta: CurrencyMeta?
    private(set) var currencies: [Currency] = []

    init(fetchCurrencyUseCase: FetchCurrencyUseCase) {
        self.fetchCurrencyUseCase = fetchCurrencyUseCase
    }

    func fetchCurrencies() {
        fetchCurrencyUseCase.fetchCurrencies { [weak self] result in
            switch result {
            case let .success((meta, currencies)):
                self?.meta = meta
                self?.currencies = currencies

                self?.onUpdate?()
            case let .failure(error):
                self?.onError?(error)
            }
        }
    }
}
