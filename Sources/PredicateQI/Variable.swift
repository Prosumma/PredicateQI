//
//  Variable.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-15.
//

import Foundation

public protocol Variable {}

public struct VariableExpression<E: Expression>: Expression, Variable {
  public let pqiExpression: NSExpression

  public init(_ expression: E) {
    pqiExpression = expression.pqiExpression
  }
}

extension VariableExpression: TypeComparable where E: TypeComparable {
  public typealias PQIComparisonType = E.PQIComparisonType
}

public func variable<E: Expression>(_ expression: E) -> VariableExpression<E> {
  VariableExpression(expression)
}

public postfix func ^ <E: Expression>(_ expression: E) -> VariableExpression<E> {
  variable(expression)
}
