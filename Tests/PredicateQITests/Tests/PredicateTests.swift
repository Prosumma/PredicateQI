//
//  PredicateTests.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 9/15/20.
//

import Nimble
import XCTest
@testable import PredicateQI

class LogicalTests: BaseTestCase {
  func testOr() {
    // When
    let smithsAndDoes = Self.customers.filter(Customer.qi.lastName == "Smith" || Customer.qi.lastName == "Doe")
    
    // Then
    expect(smithsAndDoes.count) == 3
  }
  
  func testAnd() {
    // When
    let apples = Self.products.filter { $0.name == "Apple" && $0.sku == "01-apple" }
    
    // Then
    expect(apples.count) == 1
  }
  
  func testSubquery() {
    // When
    let subquery = Order.qi.details.qiSubquery(variable: "d") { $0.quantity > 1 }.qiCount > 0
    let multiQuantityOrders = Self.orders.filter(subquery)
    
    // Then
    expect(multiQuantityOrders.count) == 1
    expect("\(subquery)") == "SUBQUERY(details, $d, $d.quantity > 1).@count > 0"
  }
}
