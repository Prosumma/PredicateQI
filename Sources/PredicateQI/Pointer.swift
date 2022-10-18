//
//  Pointer.swift
//  
//
//  Created by Greg Higley on 2022-10-16.
//

import Foundation

public struct Pointer: Expression, TypeComparable {
  public let pqiExpression: NSExpression

  public init(to object: NSObject) {
    pqiExpression = NSExpression(forConstantValue: object)
  }
}

public extension NSObject {
  var pqiObject: Pointer {
    Pointer(to: self)
  }
}

public prefix func * (object: NSObject) -> Pointer {
  object.pqiObject
}
