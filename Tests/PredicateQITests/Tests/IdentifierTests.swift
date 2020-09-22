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
  
  func testInvalidCIdentifier() {
    // Given
    let c = CIdentifier(rawValue: "c c")
    
    // Then
    expect(c).to(beNil())
  }
  
  func testValidCIdentifier() {
    // Given
    let c = CIdentifier(rawValue: "c")
    
    // Then
    expect(c).toNot(beNil())
    expect("\(c!)") == "c"
  }
  
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
  
  func testIndexLiteral() {
    // Given
    let i: Index = 3
    
    // Then
    expect(i) == Index.index(3)
  }
  
  func testIndex() {
    // Given
    let order = OrderEntity()
    
    // Then
    expect("\(order.details[0])") == "details[0]"
  }
  
  func testLastIndex() {
    // Given
    let order = OrderEntity()
    
    // Then
    expect("\(order.details.qiLast)") == "details[LAST]"
  }
  
  func testSize() {
    // Given
    let order = OrderEntity()
    
    // Then
    expect("\(order.details.qiSize)") == "details[SIZE]"
  }
  
  func testRandomVariable() {
    // Given
    let variable1 = Identifier<Int>.randomVariable()
    let variable2 = Identifier<Int>.randomVariable()
    
    // Then
    expect("\(variable1)") != "\(variable2)"
  }
  
}
