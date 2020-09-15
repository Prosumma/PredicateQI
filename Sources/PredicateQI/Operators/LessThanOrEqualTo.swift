//
//  LessThanOrEqualTo.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

public func lessThanOrEqualTo(_ lhs: Expression, _ rhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .lessThanOrEqualTo, rightExpression: rhs)
}

public func <= <L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable>(lhs: L, rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  lessThanOrEqualTo(lhs, rhs)
}

public func <= <L: Expression & TypeComparable, R: Expression & TypeComparable & Inconstant>(lhs: L, rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  lessThanOrEqualTo(lhs, rhs)
}
