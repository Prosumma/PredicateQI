//
//  Person.swift
//  
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation
import PredicateQI

@objcMembers
class Person: NSObject, Queryable {
  typealias QIType = PersonIdentifier
  var firstName: String?
  var lastName: String?
  var age: NSNumber?
  
  init(firstName: String? = nil, lastName: String? = nil, age: Int? = nil) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age.flatMap { NSNumber(value: $0) }
  }
}

class PersonIdentifier: Identifier<Person> {
  private(set) lazy var firstName = Identifier<String>(identifier: "firstName", parent: self)
  private(set) lazy var lastName = Identifier<String>(identifier: "lastName", parent: self)
  private(set) lazy var age = Identifier<Int>(identifier: "age", parent: self)
}
