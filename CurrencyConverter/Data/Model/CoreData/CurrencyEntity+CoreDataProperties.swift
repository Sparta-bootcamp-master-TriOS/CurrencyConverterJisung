import CoreData
import Foundation

public extension CurrencyEntity {
    @nonobjc class func fetchRequest() -> NSFetchRequest<CurrencyEntity> {
        return NSFetchRequest<CurrencyEntity>(entityName: "CurrencyEntity")
    }

    @NSManaged var code: String?
    @NSManaged var name: String?
    @NSManaged var rate: Double
    @NSManaged var meta: CurrencyMetaEntity?
}

extension CurrencyEntity: Identifiable {}
