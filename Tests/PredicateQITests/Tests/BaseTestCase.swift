//
//  BaseTestCase.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 9/15/20.
//

import XCTest

class BaseTestCase: XCTestCase {
  
  private(set) static var products: [Product] = []
  private(set) static var customers: [Customer] = []
  private(set) static var orders: [Order] = []

  override class func setUp() {
    super.setUp()
    
    guard products.count == 0 else { return }

    let apple = Product(sku: "01-apple", name: "Apple", price: 0.5)
    let orange = Product(sku: "01-orange", name: "Orange", price: 0.75)
    let lemon = Product(sku: "01-lemon", name: "Lemon", price: 0.65)
    let fish = Product(sku: "02-fish", name: "Fish", price: 3.25)
    products.append(contentsOf: [apple, orange, lemon, fish])

    let jane = Customer(firstName: "Jane", lastName: "Doe")
    let jon = Customer(firstName: "Jon", lastName: "Doe")
    let bob = Customer(firstName: "Bob", lastName: "Smith")
    let tony = Customer(firstName: "Tony", lastName: "Soprano")
    let carmela = Customer(firstName: "Carmela", lastName: "Soprano")
    customers.append(contentsOf: [jane, jon, bob, tony, carmela])

    let o = Order(customer: jane, date: Date())
    o.details.append(.init(product: lemon, quantity: 3))
    o.details.append(.init(product: fish, quantity: 1))
    orders.append(o)
  }

}
