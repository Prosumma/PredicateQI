//
//  OperatorTests.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 9/15/20.
//

import Nimble
import XCTest
@testable import PredicateQI

class OperatorTests: BaseTestCase {

  func testBeginsWith() {
    // When
    let fruits = Self.products.filter(Product.qi.sku.qiBeginsWith("01"))
    
    // Then
    expect(fruits.count) == 3
  }
  
  func testBetween() {
    // When
    let cheap1 = Self.products.filter { $0.price == 0...2 }
    let cheap2 = Self.products.filter(Product.qi.price.qiBetween(0, and: 2))
    
    // Then
    expect(cheap1.count) == 3
    expect(cheap2.count) == cheap1.count
  }
  
  func testContains() {
    // When
    let sopranos = Self.customers.filter { ci(di($0.lastName.qiContains("OpRá"))) }
    
    // Then
    expect(sopranos.count) == 2
  }
  
  func testEndsWith() {
    // When
    let os = Self.customers.filter{ $0.lastName.qiEndsWith("o") }
    
    // Then
    expect(os.count) == 2
  }
  
  func testEqualTo() {
    // When
    let apples = Self.products.filter { $0.sku == "01-apple" }
    
    // Then
    expect(apples.count) == 1
  }
  
  func testGreaterThan() {
    // When
    let expensive = Self.products.filter { $0.price > 100 }
    
    // Then
    expect(expensive.count) == 0
  }
  
  func testGreaterThanOrEqualTo() {
    // When
    let over19 = Self.products.filter { $0.price >= 20 }
    
    // Then
    expect(over19.count) == 0
  }
  
  func testIn() {
    // When
    let fruit1 = Self.products.filter { $0.name.qiIn("Apple", "Orange") }
    let fruit2 = Self.products.filter { $0.name == ["Apple", "Orange"] }
    
    // Then
    expect(fruit1.count) == 2
    expect(fruit2.count) == fruit1.count
  }
  
  func testLessThan() {
    // When
    let cheapos = Self.products.filter { $0.price < 2 }
    
    // Then
    expect(cheapos.count) == 3
  }
  
  func testLessThanOrEqualTo() {
    // When
    let cheapos = Self.products.filter(Product.qi.price <= 2)
    
    // Then
    expect(cheapos.count) == 3
  }
  
  func testLike() {
    // When
    let does = Self.customers.filter(Customer.qi.lastName.qiLike("*oe"))
    
    // Then
    expect(does.count) == 2
  }
  
  func testMatches() {
    // When
    let fruit = Self.products.filter { $0.sku.qiMatches("^01-.*$") }
    
    // Then
    expect(fruit.count) == 3
  }
  
  func testNotEqualTo() {
    // When
    let allProducts = Self.products.filter { $0.sku != nil }
    
    // Then
    expect(allProducts.count) == Self.products.count
  }
  
  func testNotIn() {
    // When
    let notSmithsAndDoes = Self.customers.filter { $0.lastName != ["Smith", "Doe"] }
    
    // Then
    expect(notSmithsAndDoes.count) == 2
  }
}
