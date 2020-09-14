//
//  File.swift
//  
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

public func greaterThan(_ lhs: Expression, _ rhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .greaterThan, rightExpression: rhs)
}

public func > <L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable>(lhs: L, rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  greaterThan(lhs, rhs)
}

public func > <L: Expression & TypeComparable, R: Expression & TypeComparable & Inconstant>(lhs: L, rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  greaterThan(lhs, rhs)
}
