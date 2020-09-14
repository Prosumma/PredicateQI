//
//  Contains.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

public func contains(_ lhs: Expression, _ rhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .contains, rightExpression: rhs)
}

public extension Expression where Self: TypeComparable, QIComparisonType == String {
  func qiContains<R: Expression & TypeComparable>(_ rhs: R) -> ComparisonPredicate where R.QIComparisonType == String {
    contains(self, rhs)
  }
}
