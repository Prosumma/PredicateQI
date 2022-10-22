//
//  Pointer.swift
//  
//
//  Created by Greg Higley on 2022-10-16.
//

import Foundation

public struct Pointer: Expression, TypeComparable {
  public let pqiExpression: NSExpression

  public init(to object: AnyObject) {
    pqiExpression = NSExpression(forConstantValue: object)
  }
}

public prefix func * (object: AnyObject) -> Pointer {
  Pointer(to: object)
}
