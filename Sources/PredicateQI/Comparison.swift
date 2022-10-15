//
//  Comparison.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public func compare<L: Expression, R: Expression>(
  _ lhs: L,
  _ op: NSComparisonPredicate.Operator,
  _ rhs: R
) -> PredicateBuilder {
  return { context in
    let le = lhs.pqiExpression
    let re = rhs.pqiExpression
    return NSComparisonPredicate(
      leftExpression: le,
      rightExpression: re,
      modifier: context.modifier,
      type: op,
      options: context.options
    )
  }
}

public func equal<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .equalTo, rhs)
}

public func equal<L: Expression>(_ lhs: L, to rhs: Null) -> PredicateBuilder {
  compare(lhs, .equalTo, rhs)
}

public func == <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  equal(lhs, to: rhs)
}

public func == <L>(lhs: L, rhs: Null) -> PredicateBuilder
  where L: Expression & Variable
{
  compare(lhs, .equalTo, rhs)
}


public func notEqual<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .notEqualTo, rhs)
}

public func notEqual<L: Expression>(_ lhs: L, to rhs: Null) -> PredicateBuilder {
  compare(lhs, .notEqualTo, rhs)
}

public func != <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  notEqual(lhs, to: rhs)
}

public func != <L: Expression>(lhs: L, rhs: Null) -> PredicateBuilder {
  compare(lhs, .notEqualTo, rhs)
}
