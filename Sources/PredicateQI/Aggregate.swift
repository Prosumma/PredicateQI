//
//  Aggregate.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public enum Aggregate: String {
  case count = "@count"
  case min = "@min"
  case max = "@max"
  case sum = "@sum"
  
  public var appended: Bool {
    switch self {
    case .count: return true
    default: return false
    }
  }
}

public extension Expression {
  var qiCount: TypedExpression<Int> {
    .init(NSExpression(format: "\(self).@count"))
  }
}

public extension KeyPathExpression where Self: TypeComparable, QIComparisonType == NSNumber {
  var qiSum: TypedExpression<Self> {
    .init(Identifier<Self>(aggregate: .sum, parent: self))
  }
}

public extension KeyPathExpression where Self: TypeComparable {
  var qiMin: TypedExpression<Self> {
    .init(Identifier<Self>(aggregate: .min, parent: self))
  }
  var qiMax: TypedExpression<Self> {
    .init(Identifier<Self>(aggregate: .max, parent: self))
  }
}
