//
//  Expression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

public protocol Expression: CustomStringConvertible {
  var qiExpression: NSExpression { get }
}

extension NSExpression: Expression {
  public var qiExpression: NSExpression { self }
}

public extension Expression {
  var description: String {
    String(describing: qiExpression)
  }
}
