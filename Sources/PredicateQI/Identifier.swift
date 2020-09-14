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
    case identifier(String)
    case variable(String)
    case aggregate(Aggregate)
    case index(Index)
  }
  
  public let qiParent: KeyPathExpression?
  public let qiState: State
    
  public required init(identifier: String, parent: KeyPathExpression? = nil) {
    identifier.qiAssertCStyleIdentifier()
    qiParent = parent
    qiState = .identifier(identifier)
  }
  
  public required init(variable: String) {
    variable.qiAssertCStyleIdentifier()
    qiParent = nil
    qiState = .variable(variable)
  }
  
  public required init(aggregate: Aggregate, parent: KeyPathExpression) {
    qiParent = parent
    qiState = .aggregate(aggregate)
  }
  
  public required init(index: Index, parent: KeyPathExpression) {
    qiParent = parent
    qiState = .index(index)
  }
  
  public var qiVariable: Bool {
    var variable = false
    if case .variable = qiState {
      variable = true
    }
    return qiParent?.qiVariable ?? variable
  }
      
  public var qiKeyPath: [String] {
    var keyPath: [String]
    switch qiState {
    case .identifier(let identifier):
      keyPath = (qiParent?.qiKeyPath ?? []) + [identifier]
    case .variable(let identifier):
      keyPath = [identifier]
    case .aggregate(let aggregate):
      switch aggregate {
      case .count:
        keyPath = qiParent!.qiKeyPath + [aggregate.rawValue]
      default:
        keyPath = qiParent!.qiKeyPath
        keyPath.insert(aggregate.rawValue, at: keyPath.index(before: keyPath.endIndex))
      }
    case .index(let index):
      keyPath = qiParent!.qiKeyPath
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
