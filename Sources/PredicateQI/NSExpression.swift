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
    case .anyKey:
      description = ".anyKey"
    case .block:
      description = ".block"
    case .conditional:
      description = ".conditional"
    case .constantValue:
      description = ".constantValue"
    default:
      // TODO: Fix this
      description = "foo"
    }
    return description
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
    // TODO: Handle errors, invalid combinations and parentheses
    expression = NSExpression(format: "\(lhs.pqiFormat).\(rhs.pqiFormat)")
  }
  return expression
}

func ++ (lhs: NSExpression, rhs: String) -> NSExpression {
  lhs ++ NSExpression(format: rhs)
}

func ++ (lhs: NSExpression, rhs: Int) -> NSExpression {
  // TODO: Handle errors, invalid combinations and parentheses
  NSExpression(format: "\(lhs.pqiFormat)[\(rhs)]")
}

func ++ (lhs: NSExpression, rhs: Index) -> NSExpression {
  // TODO: Handle errors, invalid combinations and parentheses
  NSExpression(format: "\(lhs.pqiFormat)[\(rhs.rawValue)]")
}

func ++ (lhs: NSExpression, rhs: Size) -> NSExpression {
  // TODO: Handle errors, invalid combinations and parentheses
  NSExpression(format: "\(lhs.pqiFormat)[\(rhs.rawValue)]")
}
