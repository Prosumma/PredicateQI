//
//  GreaterThan.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

public func greaterThan(_ lhs: Expression, _ rhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .greaterThan, rightExpression: rhs)
}

public func > <L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable>(lhs: L, rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  greaterThan(lhs, rhs)
}

public func > <L: Expression & TypeComparable, R: Expression & TypeComparable & Inconstant>(lhs: L, rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  greaterThan(lhs, rhs)
}
