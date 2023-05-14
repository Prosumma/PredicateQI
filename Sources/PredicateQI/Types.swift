//
//  Types.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public protocol ConstantExpression: Expression {}

public extension ConstantExpression {
  var pqiExpression: NSExpression {
    NSExpression(forConstantValue: self)
  }
}

extension NSNumber: ConstantExpression, TypeComparable {}
extension String: ConstantExpression, TypeComparable {}
extension Bool: ConstantExpression, TypeComparable {}
extension Data: ConstantExpression, TypeComparable {}
extension Date: ConstantExpression, TypeComparable {}

extension Int: ConstantExpression, TypeComparable {
  public typealias PQIComparisonType = NSNumber
}

extension Int16: ConstantExpression, TypeComparable {
  public typealias PQIComparisonType = NSNumber
}

extension Int32: ConstantExpression, TypeComparable {
  public typealias PQIComparisonType = NSNumber
}

extension Int64: ConstantExpression, TypeComparable {
  public typealias PQIComparisonType = NSNumber
}

extension Double: ConstantExpression, TypeComparable {
  public typealias PQIComparisonType = NSNumber
}

extension Array: Expression, ConstantExpression, TypeComparable where Element: TypeComparable {
  public typealias PQIComparisonType = Element.PQIComparisonType
}

extension Set: Expression, ConstantExpression, TypeComparable where Element: TypeComparable {
  public typealias PQIComparisonType = Element.PQIComparisonType
}

public extension Expression where Self: TypeComparable, Self.PQIComparisonType == NSNumber {
  var pqiInt: TypedExpression<Int> {
    TypedExpression(pqiExpression)
  }
  var pqiInt16: TypedExpression<Int16> {
    TypedExpression(pqiExpression)
  }
  var pqiInt32: TypedExpression<Int32> {
    TypedExpression(pqiExpression)
  }
  var pqiInt64: TypedExpression<Int64> {
    TypedExpression(pqiExpression)
  }
  var pqiDouble: TypedExpression<Double> {
    TypedExpression(pqiExpression)
  }
}
