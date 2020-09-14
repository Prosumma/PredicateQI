//
//  Null.swift
//  PredicateQI
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

public struct Null {}

extension Null: ExpressibleByNilLiteral {
  public init(nilLiteral: ()) {}
}

extension Null: Expression {
  public var qiExpression: NSExpression { NSExpression(forConstantValue: nil) }
}
