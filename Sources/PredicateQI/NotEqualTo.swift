//
//  File.swift
//  
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

public func notEqualTo(_ lhs: Expression, _ rhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .notEqualTo, rightExpression: rhs)
}

public func !=<L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable>(_ lhs: L, _ rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  return notEqualTo(lhs, rhs)
}

public func !=<L: Expression & TypeComparable, R: Expression & TypeComparable & Inconstant>(_ lhs: L, _ rhs: R) -> ComparisonPredicate where L.QIComparisonType == R.QIComparisonType {
  return notEqualTo(lhs, rhs)
}

public func !=<L: Expression & Inconstant>(_ lhs: L, _ rhs: Null) -> ComparisonPredicate {
  return notEqualTo(lhs, rhs)
}

public func !=<R: Expression & Inconstant>(_ lhs: Null, _ rhs: R) -> ComparisonPredicate {
  return notEqualTo(lhs, rhs)
}
