import CoreData
import Foundation

public extension LastSeenSceneInfoEntity {
    @nonobjc class func fetchRequest() -> NSFetchRequest<LastSeenSceneInfoEntity> {
        return NSFetchRequest<LastSeenSceneInfoEntity>(entityName: "LastSeenSceneInfoEntity")
    }

    @NSManaged var scene: String
    @NSManaged var selectedCureencyCode: String?
}

extension LastSeenSceneInfoEntity: Identifiable {}
