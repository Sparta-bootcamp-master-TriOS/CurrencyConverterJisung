import Foundation

struct FetchLatestCurrencyDataSource {
    typealias Const = SourceConstant.Local

    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func fetchLatestMeta() -> CurrencyMetaEntity? {
        let context = persistenceController.context

        let request = CurrencyMetaEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: Const.key, ascending: false)]
        request.fetchLimit = Const.fetchLimit
        request.fetchOffset = Const.fetchOffset

        let result = try? context.fetch(request)

        return result?.first
    }

    func fetchCurrencies(meta: CurrencyMetaEntity) -> [CurrencyEntity]? {
        guard let currencies = meta.currencies as? Set<CurrencyEntity> else { return .none }

        return Array(currencies)
    }
}
