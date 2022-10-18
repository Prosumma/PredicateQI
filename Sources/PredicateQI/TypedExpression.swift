//
//  TypedExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public struct TypedExpression<T: TypeComparable>: Expression, TypeComparable, Variable {
  public typealias PQIComparisonType = T.PQIComparisonType

  public let pqiExpression: NSExpression

  public init(_ expression: Expression) {
    pqiExpression = expression.pqiExpression
  }

  public init(format: String, args: [Any]) {
    pqiExpression = NSExpression(format: format, argumentArray: args)
  }

  public init(format: String, _ args: Any...) {
    self.init(format: format, args: args)
  }

  public subscript(index: Int) -> TypedExpression<T> {
    .init(pqiExpression ++ index)
  }

  public subscript(index: Index) -> TypedExpression<T> {
    .init(pqiExpression ++ index)
  }

  public subscript(size: Size) -> TypedExpression<NSNumber> {
    .init(pqiExpression ++ size)
  }
}
