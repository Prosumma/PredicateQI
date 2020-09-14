//
//  LessThan.swift
//  
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public func lessThan(_ lhs: Expression, _ rhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .lessThan, rightExpression: rhs)
}

public func < <L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable>(lhs: L, rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  lessThan(lhs, rhs)
}

public func < <L: Expression & TypeComparable, R: Expression & TypeComparable & Inconstant>(lhs: L, rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  lessThan(lhs, rhs)
}
