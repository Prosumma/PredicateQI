//
//  TypedExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public struct TypedExpression<ExpressionType: TypeComparable>: Expression & TypeComparable {
  public typealias QIComparisonType = ExpressionType.QIComparisonType
  
  public let wrapped: Expression
  
  public init(_ wrapped: Expression) {
    self.wrapped = wrapped
  }
  
  public var qiExpression: NSExpression {
    return wrapped.qiExpression
  }
}
