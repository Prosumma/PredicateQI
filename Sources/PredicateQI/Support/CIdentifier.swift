//
//  CIdentifier.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public struct CIdentifier: RawRepresentable, CustomStringConvertible, Hashable, ExpressibleByStringLiteral {
  public static func random() -> CIdentifier {
    let uuid = UUID().uuidString
    return CIdentifier("i" + uuid[uuid.index(uuid.endIndex, offsetBy: -8)..<uuid.endIndex].lowercased())
  }
  
  public let rawValue: String
  
  public init?(rawValue: String) {
    guard rawValue.qiCStyleIdentifier else { return nil }
    self.rawValue = rawValue
  }
  
  public init(_ identifier: String) {
    identifier.qiAssertCStyleIdentifier()
    rawValue = identifier
  }
    
  public init(stringLiteral value: String) {
    self.init(value)
  }
  
  public var description: String { rawValue }
}

public extension CIdentifier {
  static let SELF: CIdentifier = "SELF"
  
  static let amount: CIdentifier = "amount"
  static let date: CIdentifier = "date"
  static let firstName: CIdentifier = "firstName"
  static let id: CIdentifier = "id"
  static let lastName: CIdentifier = "lastName"
  static let name: CIdentifier = "name"
  static let price: CIdentifier = "price"
  static let quantity: CIdentifier = "quantity"
  static let sku: CIdentifier = "sku"
}
