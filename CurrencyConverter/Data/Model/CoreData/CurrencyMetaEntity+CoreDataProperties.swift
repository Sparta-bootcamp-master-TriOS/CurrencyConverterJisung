import CoreData
import Foundation

public extension CurrencyMetaEntity {
    @nonobjc class func fetchRequest() -> NSFetchRequest<CurrencyMetaEntity> {
        return NSFetchRequest<CurrencyMetaEntity>(entityName: "CurrencyMetaEntity")
    }

    @NSManaged var updatedAt: Date
    @NSManaged var currencies: NSSet
}

// MARK: Generated accessors for currencies

public extension CurrencyMetaEntity {
    @objc(addCurrenciesObject:)
    @NSManaged func addToCurrencies(_ value: CurrencyEntity)

    @objc(removeCurrenciesObject:)
    @NSManaged func removeFromCurrencies(_ value: CurrencyEntity)

    @objc(addCurrencies:)
    @NSManaged func addToCurrencies(_ values: NSSet)

    @objc(removeCurrencies:)
    @NSManaged func removeFromCurrencies(_ values: NSSet)
}

extension CurrencyMetaEntity: Identifiable {}
