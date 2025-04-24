import CoreData
import DomainLayer

public final class SaveCurrencyDataSource {
    private let persistenceController: PersistenceController

    public init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    /// CoreData에 환율 엔티티들과 메타 정보를 저장하는 메서드
    ///
    /// 이미 동일한 `updatedAt` 값을 가진 메타 정보가 존재할 경우 저장하지 않는다.
    ///
    /// - Parameters:
    ///   - currencies: 저장할 환율 정보 리스트 (`CurrencyEntityResponse`)
    ///   - meta: 저장할 환율 메타 정보 (`CurrencyMeta`)
    func execute(currencies: [CurrencyEntityResponse], meta: CurrencyMeta) {
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

        persistenceController.save()
    }
}
