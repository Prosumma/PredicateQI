//
//  KeyPathExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

public protocol KeyPathExpression: Expression {
  var qiIdentifiers: [String] { get }
  var qiState: IdentifierState { get }
  init(state: IdentifierState)
}

public extension KeyPathExpression {
  init(_ identifier: CIdentifier = .SELF, parent: KeyPathExpression? = nil) {
    self.init(state: .identifier(identifier, parent: parent))
  }
  
  init(variable: CIdentifier) {
    self.init(state: .variable(variable))
  }
  
  init(aggregate: Aggregate, parent: KeyPathExpression) {
    self.init(state: .aggregate(aggregate, parent: parent))
  }
  
  init(index: Index, parent: KeyPathExpression) {
    self.init(state: .index(index, parent: parent))
  }
  
  static func randomVariable() -> Self {
    .init(variable: CIdentifier.random())
  }
}
