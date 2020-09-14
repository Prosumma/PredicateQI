//
//  Index.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public enum Index {
  case size
  case last
  case index(UInt)
  
  public static var first: Index {
    .index(0)
  }
}

extension Index: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: UInt) {
    self = .index(value)
  }
}

extension Index: CustomStringConvertible {
  public var description: String {
    switch self {
    case .size: return "SIZE"
    case .last: return "LAST"
    case .index(let index): return "\(index)"
    }
  }
}

public extension KeyPathExpression {
  subscript(index: UInt) -> Self {
    .init(index: .index(index), parent: self)
  }
  
  var qiSize: TypedExpression<Int> {
    .init(Identifier<Int>(index: .size, parent: self))
  }
  
  var qiLast: Self {
    .init(index: .last, parent: self)
  }
}
