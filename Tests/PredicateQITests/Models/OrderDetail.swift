//
//  OrderDetail.swift
//  PredicateQITests
//
//  Created by Gregory Higley on 9/15/20.
//

import Foundation
import PredicateQI

@objcMembers
class OrderDetail: NSObject, Queryable {
  typealias QIType = OrderDetailEntity
  let product: Product
  let quantity: NSNumber
  
  init(product: Product, quantity: Int) {
    self.product = product
    self.quantity = NSNumber(value: quantity)
    super.init()
  }
}

final class OrderDetailEntity: Identifier<OrderDetail> {
  private(set) lazy var product = ProductEntity(identifier: "product", parent: self)
  private(set) lazy var quantity = Identifier<Int>(identifier: "quantity", parent: self)
}
