//
//  Matches.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

public func matches(_ lhs: Expression, _ rhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .matches, rightExpression: rhs)
}

public extension Expression where Self: TypeComparable, QIComparisonType == String {
  func qiMatches<R: Expression & TypeComparable>(_ rhs: R) -> ComparisonPredicate where R.QIComparisonType == String {
    matches(self, rhs)
  }
}
