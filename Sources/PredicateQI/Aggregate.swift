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

public extension Expression {
  var pqiSum: TypedExpression<NSNumber> {
    return (pqiExpression ++ "@sum")[NSNumber.self]
  }
}

public let pqiSum = TypedExpression<NSNumber>(format: "@sum")
