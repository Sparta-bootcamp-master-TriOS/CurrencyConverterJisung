import CoreData

struct SaveCurrencyDataSource {
    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func saveCurrencies(currencies: [CurrencyEntityResponse], meta: CurrencyMeta) {
        let context = persistenceController.context

        let request = CurrencyMetaEntity.fetchRequest()
        request.predicate = NSPredicate(format: SourceConstant.Local.updatedAtFormat, meta.updatedAt as NSDate)

        if let result = try? context.fetch(request), !result.isEmpty { return }

        let metaEntity = CurrencyMetaEntity(context: context)
        metaEntity.updatedAt = meta.updatedAt

        for currency in currencies {
            let entity = CurrencyEntity(context: context)
            entity.code = currency.code
            entity.name = currency.name
            entity.rate = currency.rate
            entity.meta = metaEntity
        }

        persistenceController.saveContext()
    }
}
