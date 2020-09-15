//
//  BeginsWith.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

/**
 Constructs a `BEGINSWITH ComparisonPredicate` from two `Expression` instances.
 
 - warning: This version ignores type-safety and is used as a low-level
 building block and "escape hatch". Use the `qiBeginsWith` method instead.
 */
public func beginsWith(_ rhs: Expression, _ lhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: rhs, operator: .beginsWith, rightExpression: lhs)
}

public extension Expression where Self: TypeComparable, QIComparisonType == String {
  /// Constructs a `BEGINSWITH ComparisonPredicate` in a type-safe manner.
  func qiBeginsWith<R: Expression & TypeComparable>(_ rhs: R) -> ComparisonPredicate where R.QIComparisonType == String {
    beginsWith(self, rhs)
  }
}
