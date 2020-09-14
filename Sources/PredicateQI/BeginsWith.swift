//
//  BeginsWith.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

public func beginsWith(_ rhs: Expression, _ lhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: rhs, operator: .beginsWith, rightExpression: lhs)
}

public extension Expression where Self: TypeComparable, QIComparisonType == String {
  func qiBeginsWith<R: Expression & TypeComparable>(_ rhs: R) -> ComparisonPredicate where R.QIComparisonType == String {
    beginsWith(self, rhs)
  }
}
