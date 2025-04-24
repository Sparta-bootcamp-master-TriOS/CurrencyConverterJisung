import Foundation

public final class FetchLatestCurrencyDataSource {
    typealias Const = SourceConstant.Local

    private let persistenceController: PersistenceController

    public init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    /// 가장 최근에 저장된 환율 엔티디 목록을 반환하는 메서드
    /// - Returns: `CurrencyEntity` 배열. 없을 경우 `nil` 반환
    func execute() -> [CurrencyEntity]? {
        guard let latestMeta = meta(),
              let currencyEntities = currencies(meta: latestMeta)
        else {
            return .none
        }

        return currencyEntities
    }

    /// CoreData에서 가장 최근에 저장된 환율 메타 정보를 가져오는 메서드
    ///
    /// 저장된 메타 정보는 `updatedAt` 기준으로 내림차순 정렬되며, 가장 최신 데이터 한 건만 반환한다.
    ///
    /// - Returns: 최신 `CurrencyMetaEntity` 객체, 없으면 `nil` 반환
    private func meta() -> CurrencyMetaEntity? {
        let context = persistenceController.context

        let request = CurrencyMetaEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: Const.key, ascending: false)]
        request.fetchLimit = Const.fetchLimit
        request.fetchOffset = Const.fetchOffset

        let result = try? context.fetch(request)

        return result?.first
    }

    /// 특정 메타 정보에 연결된 환율 엔티티들을 반환하는 메서드
    ///
    /// - Parameter meta: 연결된 메타 정보 엔티티 (`CurrencyMetaEntity`)
    /// - Returns: 해당 메타에 포함된 `CurrencyEntity` 배열, 없을 경우 `nil` 반환
    private func currencies(meta: CurrencyMetaEntity) -> [CurrencyEntity]? {
        guard let currencies = meta.currencies as? Set<CurrencyEntity> else { return .none }

        return Array(currencies)
    }
}
