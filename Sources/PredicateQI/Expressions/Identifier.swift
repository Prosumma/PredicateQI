//
//  Identifier.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

open class Identifier<IdentifierType: TypeComparable>: TypeComparable, KeyPathExpression, Inconstant, ExpressibleByStringLiteral {
  public typealias QIComparisonType = IdentifierType.QIComparisonType
  
  public let qiState: IdentifierState
  
  public required init(state: IdentifierState) {
    qiState = state
  }
  
  public required convenience init(stringLiteral value: String) {
    self.init(state: .identifier(CIdentifier(value), parent: nil))
  }
      
  open var qiIdentifiers: [String] {
    var keyPath: [String]
    switch qiState {
    case let .identifier(identifier, parent: parent):
      keyPath = (parent?.qiIdentifiers ?? []) + [identifier.rawValue]
    case let .variable(variable):
      keyPath = [variable.rawValue]
    case let .aggregate(aggregate, parent: parent):
      keyPath = parent.qiIdentifiers
      if aggregate.appended {
        keyPath += [aggregate.rawValue]
      } else {
        keyPath.insert(aggregate.rawValue, at: keyPath.index(before: keyPath.endIndex))
      }
    case let .index(index, parent: parent):
      keyPath = parent.qiIdentifiers
      let lastIndex = keyPath.index(before: keyPath.endIndex)
      let identifier = keyPath[lastIndex]
      keyPath[lastIndex] = "\(identifier)[\(index)]"
    }
    return keyPath
  }
  
  open var qiKeyPath: String {
    if qiState.isVariable {
      return "$" + qiIdentifiers.joined(separator: ".")
    } else {
      let identifiers = qiIdentifiers
      let keyPath: String
      if identifiers.count == 1 {
        keyPath = identifiers[0]
      } else {
        keyPath = identifiers.dropFirst().joined(separator: ".")
      }
      return keyPath
    }
  }

  /// Produces an `NSExpression` from the receiver
  open var qiExpression: NSExpression {
    NSExpression(format: qiKeyPath)
  }
  
}
