//
//  Subquery.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-15.
//

import Foundation

public struct Subquery: Expression {
  public let pqiExpression: NSExpression
  public var pqiKeyPathRepresentation: String {
    "(\(pqiExpression))"
  }
  
  public init(expression: Expression, variable: String, builder: PredicateBuilder) {
    pqiExpression = NSExpression(forSubquery: expression.pqiExpression, usingIteratorVariable: variable, predicate: pred(builder))
  }
}

public func subquery(_ expression: Expression, variable: String, builder: PredicateBuilder) -> Subquery {
  Subquery(expression: expression, variable: variable, builder: builder)
}
