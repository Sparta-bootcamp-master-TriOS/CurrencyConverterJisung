import DomainLayer

public final class CurrencyConverterViewModel {
    private let convertCurrencyUseCase: ConvertCurrencyUseCase
    private let saveLastSeenSceneUseCase: SaveLastSeenSceneUseCase

    var action: ((Action) -> Void)?
    private(set) var state: State

    public init(
        convertCurrencyUseCase: ConvertCurrencyUseCase,
        saveLastSeenSceneUseCase: SaveLastSeenSceneUseCase,
        currency: CurrencyDisplay
    ) {
        self.convertCurrencyUseCase = convertCurrencyUseCase
        self.saveLastSeenSceneUseCase = saveLastSeenSceneUseCase
        state = State(currency: currency)
    }

    func viewDidAppear() {
        saveLastSeenSceneUseCase.execute(
            scene: LastSeenScene.currencyConverter.rawValue,
            code: state.currency.code
        )
    }

    func convertCurrency(amountText: String) {
        guard !amountText.isEmpty else {
            action?(.didFail(ConvertError.empty))

            return
        }

        guard let amount = Double(amountText) else {
            action?(.didFail(ConvertError.noNumber))

            return
        }

        guard let result = convertCurrencyUseCase.execute(code: state.currency.code, amount: amount) else {
            return
        }

        let resultText = String(format: CurrencyConverterConstant.Label.resultFormat, result)

        state.result = resultText

        action?(.didUpdate)
    }
}
