//
//  Product.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 2020-09-15.
//

import Foundation
import PredicateQI

@objcMembers
final class Product: NSObject, Queryable {
  typealias QIType = ProductEntity
  let sku: String
  let name: String
  let price: NSNumber
  
  init(sku: String, name: String, price: Decimal) {
    self.sku = sku
    self.name = name
    self.price = NSDecimalNumber(decimal: price)
    super.init()
  }
}

final class ProductEntity: Identifier<Product> {
  private(set) lazy var sku = Identifier<String>("sku", parent: self)
  private(set) lazy var name = Identifier<String>("name", parent: self)
  private(set) lazy var price = Identifier<NSNumber>("price", parent: self)
}
