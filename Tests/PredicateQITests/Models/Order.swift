//
//  Order.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 2020-09-15.
//

import Foundation
import PredicateQI

@objcMembers
final class Order: NSObject, Queryable {
  typealias QIType = OrderEntity
  let customer: Customer
  let date: Date
  var details: [OrderDetail] = []
  
  init(customer: Customer, date: Date) {
    self.customer = customer
    self.date = date
    super.init()
    customer.orders.append(self)
  }
}

final class OrderEntity: Identifier<Order> {
  private(set) lazy var customer = CustomerEntity("customer", parent: self)
  private(set) lazy var date = Identifier<Date>("date", parent: self)
  private(set) lazy var details = OrderDetailEntity("details", parent: self)
}
