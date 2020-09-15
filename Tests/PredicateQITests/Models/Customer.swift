//
//  Customer.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 2020-09-15.
//

import Foundation
import PredicateQI

@objcMembers
final class Customer: NSObject, Queryable {
  typealias QIType = CustomerEntity
  let firstName: String
  let lastName: String
  var orders: [Order] = []
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
    super.init()
  }
}

final class CustomerEntity: Identifier<Customer> {
  private(set) lazy var firstName = Identifier<String>(identifier: "firstName", parent: self)
  private(set) lazy var lastName = Identifier<String>(identifier: "lastName", parent: self)
  private(set) lazy var orders = OrderEntity(identifier: "orders", parent: self)
}
