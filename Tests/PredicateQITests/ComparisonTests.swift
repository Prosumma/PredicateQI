//
//  ComparisonTests.swift
//  PredicateQITests
//
//  Created by Greg Higley on 2022-10-23.
//

import PredicateQI
import XCTest

final class ComparisonTests: XCTestCase {
  func testContains() {
    let house = Object<House>()
    let houses = Store.houses.filtered(using: house.address |~> "Nowhere")
    XCTAssertEqual(houses.count, 1)
  }
  
  func testCount() {
    let house = Object<House>()
    let p = house.inhabitants.pqiCount > 0
    let houses = Store.houses.filtered(using: p)
    XCTAssertEqual(houses.count, 2)
  }
  
  func testGreaterThan() {
    let house = Object<House>()
    let p = house.inhabitants[Person.self].pqiSum.age > 20
    print(pred(p))
    let houses = Store.houses.filtered(using: p)
    XCTAssertEqual(houses.count, 2)
  }
}

class Watusi {
  @objc var foo: String?
}
