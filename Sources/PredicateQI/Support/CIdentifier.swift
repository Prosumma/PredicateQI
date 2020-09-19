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
    return CIdentifier("v" + uuid[uuid.index(uuid.endIndex, offsetBy: -8)..<uuid.endIndex].lowercased())
  }
  
  public let rawValue: String
  
  public init(_ identifier: String) {
    identifier.qiAssertCStyleIdentifier()
    rawValue = identifier
  }
  
  public init?(rawValue: String) {
    self.init(rawValue)
  }
  
  public init(stringLiteral value: String) {
    self.init(value)
  }
  
  public var description: String { rawValue }
}

public extension CIdentifier {
  static let SELF: CIdentifier = "SELF"
}
