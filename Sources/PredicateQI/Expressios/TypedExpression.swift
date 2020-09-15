//
//  TypedExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

/// Wraps any `Expression` and gives it a (new) type.
public struct TypedExpression<ExpressionType: TypeComparable>: Expression & TypeComparable & Inconstant {
  public typealias QIComparisonType = ExpressionType.QIComparisonType
  
  public let wrapped: Expression
  
  public init(_ wrapped: Expression) {
    self.wrapped = wrapped
  }
  
  public var qiExpression: NSExpression {
    return wrapped.qiExpression
  }
}
