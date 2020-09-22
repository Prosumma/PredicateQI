//
//  OperatorTests.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 9/15/20.
//

import Nimble
import XCTest
@testable import PredicateQI

enum Watusi: Error {
  case watusi
}

class OperatorTests: BaseTestCase {

  func testBeginsWith() {
    // When
    let fruits = Self.products.qiFilter(Product.qi.sku.qiBeginsWith("01"))
    
    // Then
    expect(fruits.count) == 3
  }
  
  func testBetween() {
    // When
    let cheap1 = Self.products.qiFilter { $0.price == 0...2 }
    let cheap2 = Self.products.qiFilter(Product.qi.price.qiBetween(0, and: 2))
    
    // Then
    expect(cheap1.count) == 3
    expect(cheap2.count) == cheap1.count
  }
  
  func testContains() {
    // When
    let sopranos = Self.customers.qiFilter { ci(di($0.lastName.qiContains("OpRá"))) }
    
    // Then
    expect(sopranos.count) == 2
  }
  
  func testEndsWith() {
    // When
    let os = Self.customers.qiFilter{ $0.lastName.qiEndsWith("o") }
    
    // Then
    expect(os.count) == 2
  }
  
  func testEqualTo() {
    // When
    let apples1 = Self.products.qiFilter { $0.sku == "01-apple" }
    let apples2 = Self.products.qiFilter { "01-apple" == $0.sku }
    
    // Then
    expect(apples1.count) == 1
    expect(apples2.count) == apples1.count
  }
  
  func testEqualToNull() {
    // When
    let apples1 = Self.products.qiFilter { $0.sku == nil }
    let apples2 = Self.products.qiFilter { nil == $0.sku }
    
    // Then
    expect(apples1.count) == 0
    expect(apples2.count) == apples1.count
  }
  
  func testGreaterThan() {
    // When
    let expensive = Self.products.qiFilter { $0.price > 100 }
    
    // Then
    expect(expensive.count) == 0
  }
  
  func testGreaterThanOrEqualTo() {
    // When
    let over19 = Self.products.qiFilter { $0.price >= 20 }
    
    // Then
    expect(over19.count) == 0
  }
  
  func testIn() {
    // When
    let fruit1 = Self.products.qiFilter { $0.name.qiIn("Apple", "Orange") }
    let fruit2 = Self.products.qiFilter { $0.name == ["Apple", "Orange"] }
    
    // Then
    expect(fruit1.count) == 2
    expect(fruit2.count) == fruit1.count
  }
  
  func testInRange() {
    // When
    let cheapos1 = Self.products.qiFilter(Product.qi.price == [0.5, 0.75, 2.0, 3.0, 4.0, 5.0])
    let cheapos2 = Self.products.qiFilter(`in`(Product.qi.price, 0.5, 0.75, 2.0, 3.0, 4.0, 5.0))
    
    // Then
    expect(cheapos1.count) == 2
    expect(cheapos2.count) == cheapos1.count
  }
  
  func testLessThan() {
    // When
    let cheapos = Self.products.qiFilter { $0.price < 2 }
    
    // Then
    expect(cheapos.count) == 3
  }
  
  func testLessThanOrEqualTo() {
    // When
    let cheapos = Self.products.qiFilter(Product.qi.price <= 2)
    
    // Then
    expect(cheapos.count) == 3
  }
  
  func testLike() {
    // When
    let does = Self.customers.qiFilter(Customer.qi.lastName.qiLike("*oe"))
    
    // Then
    expect(does.count) == 2
  }
  
  func testMatches() {
    // When
    let fruit = Self.products.qiFilter { $0.sku.qiMatches("^01-.*$") }
    
    // Then
    expect(fruit.count) == 3
  }
  
  func testNotEqualToXYZ() {
    // When
    let allProducts1 = Self.products.qiFilter { $0.sku != "xyz" }
    let allProducts2 = Self.products.qiFilter { "xyz" != $0.sku }
    
    // Then
    expect(allProducts1.count) == Self.products.count
    expect(allProducts2.count) == allProducts1.count
  }
  
  func testNotEqualTo() {
    // When
    let allProducts1 = Self.products.qiFilter { $0.sku != nil }
    let allProducts2 = Self.products.qiFilter { nil != $0.sku }
    
    // Then
    expect(allProducts1.count) == Self.products.count
    expect(allProducts2.count) == allProducts1.count
  }
  
  func testNotIn() {
    // When
    let notSmithsAndDoes = Self.customers.qiFilter { $0.lastName != ["Smith", "Doe"] }
    
    // Then
    expect(notSmithsAndDoes.count) == 2
  }
}
