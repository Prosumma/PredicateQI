//
//  KeyPath.swift
//  PredicateQI
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

extension KeyPath: Expression {
  public var qiExpression: NSExpression {
    return NSExpression(forKeyPath: self)
  }
}

