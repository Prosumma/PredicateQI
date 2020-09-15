//
//  In.swift
//  PredicateQI
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

public func `in`<Expressions: Sequence>(_ lhs: Expression, _ rhs: Expressions) -> ComparisonPredicate where Expressions.Element: Expression {
  ComparisonPredicate(leftExpression: lhs, operator: .in, rightExpression: NSExpression(forAggregate: rhs.map(\.qiExpression)))
}

public func `in`<E: Expression>(_ lhs: Expression, _ rhs: E...) -> ComparisonPredicate {
  `in`(lhs, rhs)
}

public extension Expression where Self: TypeComparable {
  func qiIn<Expressions: Sequence>(_ rhs: Expressions) -> ComparisonPredicate where Expressions.Element: Expression & TypeComparable, Expressions.Element.QIComparisonType == Self.QIComparisonType {
    `in`(self, rhs)
  }
  
  func qiIn<E: Expression & TypeComparable>(_ rhs: E...) -> ComparisonPredicate where E.QIComparisonType == Self.QIComparisonType {
    qiIn(rhs)
  }
}

public func ==<L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable, Expressions: Sequence>(_ lhs: L, _ rhs: Expressions) -> ComparisonPredicate where Expressions.Element == R, L.QIComparisonType == R.QIComparisonType {
  `in`(lhs, rhs)
}

public func ==<L: Expression & TypeComparable & Inconstant, R: Expression & TypeComparable & Comparable, Expressions: Sequence>(_ lhs: L, _ rhs: Expressions) -> ComparisonPredicate where Expressions.Element == R, L.QIComparisonType == R.QIComparisonType {
  switch rhs {
  case let rhs as ClosedRange<R>:
    return between(lhs, rhs.lowerBound, and: rhs.upperBound)
  default:
    return `in`(lhs, rhs)
  }
}


