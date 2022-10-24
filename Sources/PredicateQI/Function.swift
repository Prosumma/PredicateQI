//
//  Function.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-24.
//

import Foundation

public func multiply<L, R>(_ lhs: L, by rhs: R) -> some (Expression & TypeComparable<NSNumber>)
  where L: Expression & TypeComparable<NSNumber>,
        R: Expression & TypeComparable<NSNumber>
{
  NSExpression(forFunction: "multiply:by:", arguments: [lhs.pqiExpression, rhs.pqiExpression])[NSNumber.self]
}

public func * <L, R>(lhs: L, rhs: R) -> some (Expression & TypeComparable<NSNumber>)
  where L: Expression & TypeComparable<NSNumber> & Variable,
        R: Expression & TypeComparable<NSNumber>
{
  multiply(lhs, by: rhs)
}
