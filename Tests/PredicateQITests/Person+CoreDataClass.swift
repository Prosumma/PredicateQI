//
//  Person+CoreDataClass.swift
//  
//
//  Created by Greg Higley on 2022-10-15.
//
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {
  @NSManaged public var name: String
  @NSManaged public var age: Int16
  @NSManaged public var house: House?
}
