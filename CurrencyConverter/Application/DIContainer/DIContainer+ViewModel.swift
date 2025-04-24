import PresentationLayer

extension DIContainer {
    /// CurrencyInfoViewModel 생성
    func makeCurrencyInfoViewModel() -> CurrencyInfoViewModel {
        CurrencyInfoViewModel(
            fetchAndCompareCurrencyUseCase: makeFetchAndCompareCurrencyUseCase(),
            fetchFavoriteUseCase: makeFetchFavoriteUseCase(),
            saveFavoriteUseCase: makeSaveFavoriteUseCase(),
            saveLastSeenSceneUseCase: makeSaveLastSeenSceneUseCase()
        )
    }

    /// CurrencyConverterViewModel 생성
    func makeCurrencyConverterViewModel(with currency: CurrencyDisplay) -> CurrencyConverterViewModel {
        CurrencyConverterViewModel(
            convertCurrencyUseCase: makeConvertCurrencyUseCase(),
            saveLastSeenSceneUseCase: makeSaveLastSeenSceneUseCase(),
            currency: currency
        )
    }
}
