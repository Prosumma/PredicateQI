//
//  ComparisonTests.swift
//  PredicateQITests
//
//  Created by Greg Higley on 2022-10-23.
//

import PredicateQI
import XCTest

final class ComparisonTests: XCTestCase {
  override class func setUp() {
    super.setUp()
    PredicateQIConfiguration.logPredicatesToConsole = true
  }
  
  func testEqual() {
    let houses = Store.houses.pqiFilter { $0 == *Store.houses[0] }
    XCTAssertEqual(houses.count, 1)
  }
  
  func testEqualNil() {
    let houses = Store.houses.pqiFilter { $0.address == nil }
    XCTAssertEqual(houses.count, 1)
  }
  
  func testNotEqual() {
    let houses = Store.houses.pqiFilter { all($0.inhabitants[Person.self].lastName != "Kubrick") }
    XCTAssertEqual(houses.count, 3)
  }
  
  func testNotEqualNil() {
    let houses = Store.houses.pqiFilter { $0.address != nil }
    XCTAssertEqual(houses.count, 2)
  }
  
  func testContains() {
    let houses = Store.houses.pqiFilter { $0.address |~> "Nowhere" }
    XCTAssertEqual(houses.count, 1)
  }
  
  func testInString() {
    let houses = Store.houses.pqiFilter { "Nowhere"^ <~| $0.address }
    XCTAssertEqual(houses.count, 1)
  }
  
  func testInCollection() {
    let names: Set<String> = ["99 Nowhere St.", "Bad Address"]
    let houses = Store.houses.pqiFilter { $0.address <~| names }
    XCTAssertEqual(houses.count, 1)
  }
  
  func testLessThan() {
    let houses = Store.houses.pqiFilter { $0.inhabitants.pqiCount < 10 }
    XCTAssertEqual(houses.count, 3)
  }
  
  func testLessThanOrEqualTo() {
    let houses = Store.houses.pqiFilter { $0.inhabitants[Person.self].pqiMin.age <= 10 }
    XCTAssertEqual(houses.count, 1)
  }
  
  func testGreaterThan() {
    let houseSet = Set(Store.houses)
    let houses = houseSet.pqiFilter { $0.inhabitants[Person.self].pqiSum.age > 20 }
    XCTAssertEqual(houses.count, 2)
  }
  
  func testGreaterThanOrEqualTo() {
    let houses = Store.houses.pqiFilter { $0.inhabitants[Person.self].pqiCount >= 2 }
    XCTAssertEqual(houses.count, 1)
  }
  
  func testBetween() {
    let houses = Store.houses.pqiFilter { any($0.inhabitants[Person.self].age <|> 7...11) }
    XCTAssertEqual(houses.count, 1)
  }
  
  func testMatches() {
    let houses = Store.houses.pqiFilter { ci($0.address %~ ".*WHERE.*") }
    XCTAssertEqual(houses.count, 2)
  }
  
  func testLike() {
    let houses = Store.houses.pqiFilter { di($0.address %* "*whére*") }
    XCTAssertEqual(houses.count, 2)
  }
}
