//
//  Comparison.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

// swiftlint:disable opening_brace indentation_width

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

public func equal<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
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

public func == <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
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

public func notEqual<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
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

public func != <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
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

public func greater<L, R>(_ lhs: L, than rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .greaterThan, rhs)
}

public func > <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  greater(lhs, than: rhs)
}

public func > <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  greater(lhs, than: rhs)
}

public func greaterThanOrEqual<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .greaterThanOrEqualTo, rhs)
}

public func greaterThanOrEqual<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .greaterThanOrEqualTo, rhs)
}

public func >= <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  greaterThanOrEqual(lhs, to: rhs)
}

public func >= <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  greaterThanOrEqual(lhs, to: rhs)
}

public func less<L, R>(_ lhs: L, than rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .lessThan, rhs)
}

public func less<L, R>(_ lhs: L, than rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .lessThan, rhs)
}

public func < <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  less(lhs, than: rhs)
}

public func < <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  less(lhs, than: rhs)
}

public func lessThanOrEqual<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .lessThanOrEqualTo, rhs)
}

public func lessThanOrEqual<L, R>(_ lhs: L, to rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .lessThanOrEqualTo, rhs)
}

public func <= <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  lessThanOrEqual(lhs, to: rhs)
}

public func <= <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  lessThanOrEqual(lhs, to: rhs)
}

public func `in`<L, R>(_ lhs: L, _ rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .in, rhs)
}

public func `in`<L, R>(_ lhs: L, _ rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .in, rhs)
}

public func <~| <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  `in`(lhs, _: rhs)
}

public func <~| <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  `in`(lhs, _: rhs)
}

public func contains<L, R>(_ lhs: L, _ rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .contains, rhs)
}

public func contains<L, R>(_ lhs: L, _ rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .contains, rhs)
}

public func |~> <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  contains(lhs, _: rhs)
}

public func |~> <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  contains(lhs, _: rhs)
}

public func begins<L, R>(_ lhs: L, with rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .beginsWith, rhs)
}

public func begins<L, R>(_ lhs: L, with rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .beginsWith, rhs)
}

public func <~% <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  begins(lhs, with: rhs)
}

public func <~% <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  begins(lhs, with: rhs)
}

public func ends<L, R>(_ lhs: L, with rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .endsWith, rhs)
}

public func ends<L, R>(_ lhs: L, with rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .endsWith, rhs)
}

public func %~> <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  ends(lhs, with: rhs)
}

public func %~> <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  ends(lhs, with: rhs)
}

public func like<L, R>(_ lhs: L, _ rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  compare(lhs, .like, rhs)
}

public func like<L, R>(_ lhs: L, _ rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable,
        R: Expression
{
  compare(lhs, .like, rhs)
}

public func % <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & TypeComparable & Variable,
        R: Expression & TypeComparable,
        L.PQIComparisonType == R.PQIComparisonType
{
  like(lhs, _: rhs)
}

public func % <L, R>(lhs: L, rhs: R) -> PredicateBuilder
  where L: Expression & AnyComparable & Variable,
        R: Expression
{
  like(lhs, _: rhs)
}
