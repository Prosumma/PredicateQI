//
//  Null.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public struct Null: ExpressibleByNilLiteral, Expression {
  public init(nilLiteral: ()) {}
  public let pqiExpression = NSExpression(forConstantValue: nil)
}
