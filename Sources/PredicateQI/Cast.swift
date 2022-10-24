//
//  Cast.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-23.
//

import Foundation

public func cast<T: NSObject>(_ expression: Expression, to type: T.Type) -> Object<T> {
  .init(expression.pqiExpression)
}

public func cast<T: NSObject & TypeComparable>(
  _ expression: Expression,
  to type: T.Type
) -> Object<T> {
  .init(expression.pqiExpression)
}

public func cast<T: TypeComparable>(
  _ expression: Expression,
  to type: T.Type
) -> TypedExpression<T> {
  .init(expression.pqiExpression)
}

public func cast<T: NSObject & TypeComparable & ScalarComparable>(
  _ expression: Expression,
  to type: T.Type
) -> TypedExpression<T> {
  .init(expression.pqiExpression)
}
