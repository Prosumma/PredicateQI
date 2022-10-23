//
//  Aggregate.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-15.
//

import Foundation

public extension Expression {
  var pqiCount: TypedExpression<NSNumber> {
    return (pqiExpression ++ "@count")[NSNumber.self]
  }
}

public let pqiCount = TypedExpression<NSNumber>(format: "@count")

public let pqiSum = TypedExpression<NSNumber>(format: "@sum")
