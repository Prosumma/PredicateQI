//
//  Person+CoreDataProperties.swift
//  
//
//  Created by Greg Higley on 2022-10-15.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var age: Int16
    @NSManaged public var house: House?

}
