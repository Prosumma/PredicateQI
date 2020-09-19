//
//  IdentifierState.swift
//  PredicateQI
//
//  Created by Gregory Higley on 9/14/20.
//

public enum IdentifierState {
  case identifier(CIdentifier, parent: KeyPathExpression?)
  case variable(CIdentifier)
  case aggregate(Aggregate, parent: KeyPathExpression)
  case index(Index, parent: KeyPathExpression)
      
  public var parent: KeyPathExpression? {
    switch self {
    case let .identifier(_, parent: parent): return parent
    case .variable: return nil
    case let .aggregate(_, parent: parent): return parent
    case let .index(_, parent: parent): return parent
    }
  }
  
  public var isVariable: Bool {
    switch self {
    case let .identifier(_, parent: parent): return parent?.qiState.isVariable ?? false
    case .variable: return true
    case let .aggregate(_, parent: parent): return parent.qiState.isVariable
    case let .index(_, parent: parent): return parent.qiState.isVariable
    }
  }
}

