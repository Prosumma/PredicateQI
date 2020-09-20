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
    // We need the i prefix because the first "digit" of a UUID could be numeric.
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
}
