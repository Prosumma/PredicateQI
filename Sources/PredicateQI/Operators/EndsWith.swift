//
//  EndsWith.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

public func endsWith(_ rhs: Expression, _ lhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: rhs, operator: .endsWith, rightExpression: lhs)
}

public extension Expression where Self: TypeComparable, QIComparisonType == String {
  func qiEndsWith<R: Expression & TypeComparable>(_ rhs: R) -> ComparisonPredicate where R.QIComparisonType == String {
    endsWith(self, rhs)
  }
}
