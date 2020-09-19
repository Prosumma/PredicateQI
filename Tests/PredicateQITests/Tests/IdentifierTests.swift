//
//  IdentifierTests.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 2020-09-19.
//

import Nimble
import XCTest
@testable import PredicateQI

class IdentifierTests: XCTestCase {
  
  func testVariable() {
    // Given
    let o = OrderEntity(variable: "o")
    
    // Then
    expect("\(o.details.quantity)") == "$o.details.quantity"
  }
  
  func testAggregate() {
    // Given
    let o = OrderEntity()
    
    // Then
    expect("\(o.details.quantity.qiMax)") == "details.@max.quantity"
  }
  
  func testSingle() {
    // Given
    let x: Identifier<String> = "x"
    
    // Then
    expect("\(x)") == "x"
  }
  
  func testAppendedAggregate() {
    // Given
    let count = Identifier<Int>(aggregate: .count, parent: OrderDetailEntity().quantity)
    
    // Then
    expect("\(count)") == "quantity.@count"
  }
  
  func testIndex() {
    // Given
    let order = OrderEntity()
    
    // Then
    expect("\(order.details[0])") == "details[0]"
  }
  
}
