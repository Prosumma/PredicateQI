//
//  NSExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-15.
//

import Foundation

extension NSExpression: Expression {
  public var pqiExpression: NSExpression { self }
}

extension NSExpression.ExpressionType {
  var pqiDescription: String {
    let description: String
    switch self {
    case .aggregate:
      description = "aggregate"
    case .anyKey:
      description = "anyKey"
    case .block:
      description = "block"
    case .conditional:
      description = "conditional"
    case .constantValue:
      description = "constantValue"
    case .function:
      description = "function"
    case .intersectSet:
      description = "intersectSet"
    case .keyPath:
      description = "keyPath"
    case .minusSet:
      description = "minusSet"
    case .unionSet:
      description = "unionSet"
    case .subquery:
      description = "subquery"
    case .variable:
      description = "variable"
    default:
      description = "unknown"
    }
    return ".\(description)"
  }
}

private extension NSExpression {
  var pqiFormat: String {
    let format: String
    switch expressionType {
    case .block:
      preconditionFailure("NSExpression of type block is not supported.")
    case .function:
      format = "(\(self))"
    default:
      format = "\(self)"
    }
    return format
  }
}

infix operator ++

func ++ (lhs: NSExpression, rhs: NSExpression) -> NSExpression {
  let expression: NSExpression
  switch (lhs.expressionType, rhs.expressionType) {
  case (.evaluatedObject, _):
    expression = rhs
  case (_, .evaluatedObject):
    expression = lhs
  default:
    expression = NSExpression(format: "\(lhs.pqiFormat).\(rhs.pqiFormat)")
  }
  return expression
}

func ++ (lhs: NSExpression, rhs: String) -> NSExpression {
  lhs ++ NSExpression(format: rhs)
}

func ++ (lhs: NSExpression, rhs: Int) -> NSExpression {
  NSExpression(format: "\(lhs.pqiFormat)[\(rhs)]")
}

func ++ (lhs: NSExpression, rhs: Index) -> NSExpression {
  NSExpression(format: "\(lhs.pqiFormat)[\(rhs.rawValue)]")
}

func ++ (lhs: NSExpression, rhs: Size) -> NSExpression {
  NSExpression(format: "\(lhs.pqiFormat)[\(rhs.rawValue)]")
}
