//
//  Identifier.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

open class Identifier<IdentifierType: TypeComparable>: TypeComparable, KeyPathExpression, Inconstant {
  public typealias QIComparisonType = IdentifierType.QIComparisonType
  
  public enum State {
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
  }
  
  public let qiState: State
  
  /**
   `init(state:)` is the designated initializer. Use this only in
   subclasses. When creating an instance, use one of the convenience
   initializers.
   */
  public required init(state: State) {
    qiState = state
  }
    
  public required convenience init(identifier: CIdentifier, parent: KeyPathExpression? = nil) {
    self.init(state: .identifier(identifier, parent: parent))
  }
  
  public required convenience init(variable: CIdentifier) {
    self.init(state: .variable(variable))
  }
  
  public required convenience init(aggregate: Aggregate, parent: KeyPathExpression) {
    self.init(state: .aggregate(aggregate, parent: parent))
  }
  
  public required convenience init(index: Index, parent: KeyPathExpression) {
    self.init(state: .index(index, parent: parent))
  }
  
  public var qiVariable: Bool {
    var variable = false
    if case .variable = qiState {
      variable = true
    }
    return qiState.parent?.qiVariable ?? variable
  }
      
  public var qiKeyPath: [String] {
    var keyPath: [String]
    switch qiState {
    case let .identifier(identifier, parent: parent):
      keyPath = (parent?.qiKeyPath ?? []) + [identifier.rawValue]
    case let .variable(variable):
      keyPath = [variable.rawValue]
    case let .aggregate(aggregate, parent: parent):
      keyPath = parent.qiKeyPath
      switch aggregate {
      case .count:
        keyPath += [aggregate.rawValue]
      default:
        keyPath.insert(aggregate.rawValue, at: keyPath.index(before: keyPath.endIndex))
      }
    case let .index(index, parent: parent):
      keyPath = parent.qiKeyPath
      let lastIndex = keyPath.index(before: keyPath.endIndex)
      let identifier = keyPath[lastIndex]
      keyPath[lastIndex] = "\(identifier)[\(index)]"
    }
    return keyPath
  }
  
  open var qiExpression: NSExpression {
    if qiVariable {
      return NSExpression(format: "$" + qiKeyPath.joined(separator: "."))
    } else {
      let identifiers = qiKeyPath
      let keyPath: String
      if identifiers.count == 1 {
        keyPath = identifiers[0]
      } else {
        keyPath = identifiers.dropFirst().joined(separator: ".")
      }
      return NSExpression(format: keyPath)
    }
  }
  
}

