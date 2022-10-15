//
//  TypedExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public struct TypedExpression<T: TypeComparable>: Expression, TypeComparable {
  public typealias PQIComparisonType = T.PQIComparisonType
  
  public let pqiExpression: NSExpression
  
  public init(_ expression: NSExpression) {
    pqiExpression = expression
  }
  
  public init(format: String, args: [Any]) {
    pqiExpression = NSExpression(format: format, argumentArray: args)
  }
  
  public init(format: String, _ args: Any...) {
    self.init(format: format, args: args)
  }
}
