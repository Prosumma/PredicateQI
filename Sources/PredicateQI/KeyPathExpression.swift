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
  init(identifier: CIdentifier, parent: KeyPathExpression?)
  init(variable: CIdentifier)
  init(aggregate: Aggregate, parent: KeyPathExpression)
  init(index: Index, parent: KeyPathExpression)
}
