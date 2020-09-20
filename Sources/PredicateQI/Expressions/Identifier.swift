//
//  Identifier.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

/**
 Represents an `Identifier` in a KVC-style key path. Since it optionally includes a reference to its
 parent, a full KVC-compliant key path can be generated from it.
 
 For simple types such as strings and numbers, `Identifier` should be used directly, for example:
 
 ```swift
 let name = Identifier<String>("name")
 let quantity = Identifier<Int>("quantity")
 ```
 
 In fact, since `Identifier` implements `ExpressiblyByStringLiteral`, an even shorter syntax is possible:
 
 ```swift
 let name: Identifier<String> = "name"
 let quantity: Identifier<Int> = "quantity"
 ```
 
 For composite types, `Identifier` is designed to be subclassed.
 
 ```swift
 @objcMembers
 class Product: NSObject, Queryable {
   typealias QIType = ProductEntity
   var name: String
   var sku: String
   var count: Int
 }
 
 final class ProductEntity: Identifier<Product> {
   private(set) lazy var name = Identifier<String>("name", parent: self)
   private(set) lazy var sku = Identifier<String>("sku", parent: self)
   private(set) lazy var count = Identifier<Int>("count", parent: self)
 }
 ```
 
 Given this, it's easy to construct a predicate to query an array of products:
 
 ```swift
 products.filter { $0.count > 0 }
 ```
 
 Where `$0` is an instance of `ProductEntity`.
 */
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
