//
//  KeyPathExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

public protocol KeyPathExpression: Expression {
  var qiKeyPath: [String] { get }
  var qiVariable: Bool { get }
  init(identifier: String, parent: KeyPathExpression?)
  init(variable: String)
  init(aggregate: Aggregate, parent: KeyPathExpression)
  init(index: Index, parent: KeyPathExpression)
}
