//
//  Expression.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public protocol Expression {
  var pqiExpression: NSExpression { get }
}

public extension Expression {
  subscript<T: TypeComparable>(type: T.Type) -> TypedExpression<T> {
    .init(pqiExpression)
  }
}
