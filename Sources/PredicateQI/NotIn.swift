//
//  NotIn.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

public func !=<L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable, Expressions: Sequence>(_ lhs: L, _ rhs: Expressions) -> Predicate where Expressions.Element == R, L.QIComparisonType == R.QIComparisonType {
  !`in`(lhs, rhs)
}
