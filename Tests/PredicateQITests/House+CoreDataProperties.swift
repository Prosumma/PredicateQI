//
//  House+CoreDataProperties.swift
//  
//
//  Created by Greg Higley on 2022-10-15.
//
//

import Foundation
import CoreData


extension House {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<House> {
        return NSFetchRequest<House>(entityName: "House")
    }

    @NSManaged public var address: String
    @NSManaged public var inhabitants: Set<Person>

}

// MARK: Generated accessors for inhabitants
extension House {

    @objc(addInhabitantsObject:)
    @NSManaged public func addToInhabitants(_ value: Person)

    @objc(removeInhabitantsObject:)
    @NSManaged public func removeFromInhabitants(_ value: Person)

    @objc(addInhabitants:)
    @NSManaged public func addToInhabitants(_ values: NSSet)

    @objc(removeInhabitants:)
    @NSManaged public func removeFromInhabitants(_ values: NSSet)

}
