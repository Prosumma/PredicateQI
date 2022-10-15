//
//  Expression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public protocol Expression {
  var pqiExpression: NSExpression { get }
  var pqiKeyPathRepresentation: String { get }
}

public extension Expression {
  var pqiKeyPathRepresentation: String {
    "\(pqiExpression)"
  }
}
