//
//  Identifier.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

open class Identifier<IdentifierType: TypeComparable>: TypeComparable, KeyPathExpression, Inconstant {
  public typealias QIComparisonType = IdentifierType.QIComparisonType
  
  public let qiState: IdentifierState
  
  public required init(state: IdentifierState) {
    qiState = state
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
    if qiState.isVariable {
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

