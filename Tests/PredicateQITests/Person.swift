//
//  Person.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 2022-10-23.
//

import Foundation

class Person: NSObject {
  @objc let firstName: String
  @objc let lastName: String
  @objc let age: Int
  
  public init(firstName: String, lastName: String, age: Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
}
