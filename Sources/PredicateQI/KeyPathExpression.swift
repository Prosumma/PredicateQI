//
//  KeyPathExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

public protocol KeyPathExpression: Expression {
  var qiKeyPath: [String] { get }
  var qiVariable: Bool { get }
  init(identifier: String, parent: KeyPathExpression?)
  init(variable: String)
}
