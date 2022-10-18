//
//  House+CoreDataClass.swift
//  
//
//  Created by Greg Higley on 2022-10-15.
//
//

import Foundation
import CoreData

@objc(House)
public class House: NSManagedObject {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<House> {
    NSFetchRequest<House>(entityName: "House")
  }

  @NSManaged public var address: String
  @NSManaged public var inhabitants: Set<Person>
}
