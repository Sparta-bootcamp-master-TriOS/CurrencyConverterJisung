import CoreData
import Foundation

public extension FavoriteEntity {
    @nonobjc class func fetchRequest() -> NSFetchRequest<FavoriteEntity> {
        return NSFetchRequest<FavoriteEntity>(entityName: "FavoriteEntity")
    }

    @NSManaged var code: String?
    @NSManaged var isFavorite: Bool
}

extension FavoriteEntity: Identifiable {}
