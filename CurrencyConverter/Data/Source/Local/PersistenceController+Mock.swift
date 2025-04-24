import CoreData

extension PersistenceController {
    /// Mock 객체 생성 메서드
    static func makeInMemory() -> PersistenceController {
        let controller = PersistenceController(inMemory: true)

        injectMockCurrencyData(into: controller.context)

        return controller
    }

    /// Mock 데이터 삽입 메서드
    ///
    /// 1년 전 날짜로 `CurrencyMetaEntity`를 생성한다.
    static func injectMockCurrencyData(into context: NSManagedObjectContext) {
        let meta = CurrencyMetaEntity(context: context)
        let currentAPITime: TimeInterval = 1_745_366_552
        let oneYearAgoTime = currentAPITime - 31_536_000
        meta.updatedAt = Date(timeIntervalSince1970: oneYearAgoTime)

        let currencies: [CurrencyEntityResponse] = [
            .init(code: "AED", name: "아랍에미리트", rate: 0.000_000_001),
            .init(code: "AFN", name: "아프가니스탄", rate: 999_999_999.0),
        ]

        for currency in currencies {
            let entity = CurrencyEntity(context: context)
            entity.code = currency.code
            entity.name = currency.name
            entity.rate = currency.rate
            entity.meta = meta

            meta.addToCurrencies(entity)
        }

        try? context.save()
    }
}
