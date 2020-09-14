//
//  File.swift
//  
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

public func !=<L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable, Expressions: Sequence>(_ lhs: L, _ rhs: Expressions) -> Predicate where Expressions.Element == R, L.QIComparisonType == R.QIComparisonType {
  !`in`(lhs, rhs)
}
