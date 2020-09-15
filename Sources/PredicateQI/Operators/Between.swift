//
//  Between.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public func between(_ lhs: Expression, _ rhs1: Expression, and rhs2: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .between, rightExpression: NSExpression(forAggregate: [rhs1.qiExpression, rhs2.qiExpression]))
}

public extension Expression where Self: TypeComparable {
  func qiBetween<R1: Expression & TypeComparable, R2: Expression & TypeComparable>(_ rhs1: R1, and rhs2: R2) -> ComparisonPredicate where R1.QIComparisonType == Self.QIComparisonType, R2.QIComparisonType == Self.QIComparisonType {
    between(self, rhs1, and: rhs2)
  }
}
