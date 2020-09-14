//
//  Aggregate.swift
//  
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public enum Aggregate: String {
  case count = "@count"
  case min = "@min"
  case max = "@max"
  case sum = "@sum"
}

public extension KeyPathExpression where Self: TypeComparable, QIComparisonType == NSNumber {
  var qiSum: some KeyPathExpression & TypeComparable {
    return Identifier<Self>(aggregate: .sum, parent: self)
  }
}

public extension KeyPathExpression where Self: TypeComparable {
  var qiCount: TypedExpression<Int> {
    .init(Identifier<Self>(aggregate: .count, parent: self))
  }
  var qiMin: TypedExpression<Self> {
    .init(Identifier<Self>(aggregate: .min, parent: self))
  }
  var qiMax: TypedExpression<Self> {
    .init(Identifier<Self>(aggregate: .max, parent: self))
  }
}
