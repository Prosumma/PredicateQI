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

public func == <L: Expression & Variable>(lhs: L, rhs: Null) -> PredicateBuilder {
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

public func != <L: Expression & Variable>(lhs: L, rhs: Null) -> PredicateBuilder {
  compare(lhs, .notEqualTo, rhs)
}

public func greater<L, R>(_ lhs: L, than rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .greaterThan, rhs)
}

public func greater<L: Expression>(_ lhs: L, than rhs: Null) -> PredicateBuilder {
  compare(lhs, .greaterThan, rhs)
}

public func > <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  greater(lhs, than: rhs)
}

public func > <L: Expression & Variable>(lhs: L, rhs: Null) -> PredicateBuilder {
  compare(lhs, .greaterThan, rhs)
}

public func greaterThanOrEqual<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .greaterThanOrEqualTo, rhs)
}

public func greaterThanOrEqual<L: Expression>(_ lhs: L, to rhs: Null) -> PredicateBuilder {
  compare(lhs, .greaterThanOrEqualTo, rhs)
}

public func >= <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  greaterThanOrEqual(lhs, to: rhs)
}

public func >= <L: Expression & Variable>(lhs: L, rhs: Null) -> PredicateBuilder {
  compare(lhs, .greaterThanOrEqualTo, rhs)
}

public func less<L, R>(_ lhs: L, than rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .lessThan, rhs)
}

public func less<L: Expression>(_ lhs: L, than rhs: Null) -> PredicateBuilder {
  compare(lhs, .lessThan, rhs)
}

public func < <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  less(lhs, than: rhs)
}

public func < <L: Expression & Variable>(lhs: L, rhs: Null) -> PredicateBuilder {
  compare(lhs, .lessThan, rhs)
}

public func lessThanOrEqual<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .lessThanOrEqualTo, rhs)
}

public func lessThanOrEqual<L: Expression>(_ lhs: L, to rhs: Null) -> PredicateBuilder {
  compare(lhs, .lessThanOrEqualTo, rhs)
}

public func <= <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  lessThanOrEqual(lhs, to: rhs)
}

public func <= <L: Expression & Variable>(lhs: L, rhs: Null) -> PredicateBuilder {
  compare(lhs, .lessThanOrEqualTo, rhs)
}
