//
//  Pointer.swift
//  
//
//  Created by Greg Higley on 2022-10-16.
//

import Foundation

public struct Pointer: Expression, TypeComparable {
  let object: NSObject
  
  public var pqiExpression: NSExpression {
    NSExpression(forConstantValue: object)
  }
  
  public init(to object: NSObject) {
    self.object = object
  }
}

public extension NSObject {
  var pqiObject: Pointer {
    Pointer(to: self)
  }
}
