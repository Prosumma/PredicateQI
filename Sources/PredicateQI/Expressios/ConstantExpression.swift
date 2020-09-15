//
//  ConstantExpression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

public protocol ConstantExpression: Expression {}

public extension ConstantExpression {
  var qiExpression: NSExpression {
    return NSExpression(forConstantValue: self)
  }
}
