//
//  Models.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation
import PredicateQI

@objcMembers
class Person: NSObject, Queryable {
  typealias QIType = PersonIdentifier
  var firstName: String
  var lastName: String
  var age: NSNumber?
  
  init(firstName: String, lastName: String, age: Int? = nil) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age.flatMap { NSNumber(value: $0) }
  }
}

@objcMembers
class Band: NSObject, Queryable {
  typealias QIType = BandIdentifier
  var name: String
  var members: [Person] = []
  
  public init(name: String, members: [Person]) {
    self.name = name
    self.members = members
  }
}

class PersonIdentifier: Identifier<Person> {
  private(set) lazy var firstName = Identifier<String>(identifier: "firstName", parent: self)
  private(set) lazy var lastName = Identifier<String>(identifier: "lastName", parent: self)
  private(set) lazy var age = Identifier<Int>(identifier: "age", parent: self)
}

class BandIdentifier: Identifier<Band> {
  private(set) lazy var name = Identifier<String>(identifier: "name", parent: self)
  private(set) lazy var members = PersonIdentifier(identifier: "members", parent: self)
}

let bands = [
  Band(name: "Depeche Mode", members: [
    Person(firstName: "Martin", lastName: "Gore", age: 59),
    Person(firstName: "David", lastName: "Gahan", age: 58),
    Person(firstName: "Alan", lastName: "Wilder", age: 61),
    Person(firstName: "Andy", lastName: "Fletcher", age: 59)
  ]),
  Band(name: "The Smiths", members: [
    Person(firstName: "Stephen", lastName: "Morrissey", age: 61),
    Person(firstName: "Johnny", lastName: "Marr", age: 56),
    Person(firstName: "Mike", lastName: "Joyce", age: 57),
    Person(firstName: "Andy", lastName: "Rourke", age: 56)
  ]),
  Band(name: "Dead Kennedys", members: [
    Person(firstName: "Jello", lastName: "Biafra", age: 62),
    Person(firstName: "East Bay", lastName: "Ray", age: 61),
    Person(firstName: "Klaus", lastName: "Flouride", age: 71),
    Person(firstName: "D. H.", lastName: "Peligro", age: 61)
  ])
]
