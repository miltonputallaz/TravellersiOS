//
//  Travel+CoreDataProperties.swift
//  Travellers
//
//  Created by Milton Putallaz on 18/02/2025.
//
//

import Foundation
import CoreData


extension Travel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Travel> {
        return NSFetchRequest<Travel>(entityName: "Travel")
    }
    
    @nonobjc public class func deleteAll() -> NSBatchDeleteRequest {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Travel")
        return NSBatchDeleteRequest(fetchRequest: fetchRequest)
    }

    @NSManaged public var title: String
    @NSManaged public var desc: String?
    @NSManaged public var id: String
    @NSManaged public var owner: Bool
    @NSManaged public var imageId: String
    
    func toExternalModel() -> ExternalTravel {
        return ExternalTravel(title: title, description: desc, id: id, owner: owner, imageId: imageId)
    }

}

extension Travel : Identifiable {
    
}
