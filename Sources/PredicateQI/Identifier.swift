//
//  Identifier.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

open class Identifier<IdentifierType: TypeComparable>: TypeComparable, KeyPathExpression, Inconstant {
  public typealias QIComparisonType = IdentifierType.QIComparisonType
  
  public let qiParent: KeyPathExpression?
  public let qiIdentifier: String
  private let _variable: Bool
  
  public required init(identifier: String, parent: KeyPathExpression? = nil) {
    identifier.qiAssertCStyleIdentifier()
    qiParent = parent
    qiIdentifier = identifier
    _variable = false
  }
  
  public required init(variable: String) {
    variable.qiAssertCStyleIdentifier()
    qiParent = nil
    qiIdentifier = variable
    _variable = true
  }
  
  public var qiVariable: Bool {
    return qiParent?.qiVariable ?? _variable
  }
      
  public var qiKeyPath: [String] {
    guard let parent = qiParent else {
      return [qiIdentifier]
    }
    return parent.qiKeyPath + [qiIdentifier]
  }
  
  open var qiExpression: NSExpression {
    if qiVariable {
      return NSExpression(forVariable: qiKeyPath.joined(separator: "."))
    } else {
      let identifiers = qiKeyPath
      let keyPath: String
      if identifiers.count == 1 {
        keyPath = identifiers[0]
      } else {
        keyPath = identifiers.dropFirst().joined(separator: ".")
      }
      return NSExpression(forKeyPath: keyPath)
    }
  }
  
}
