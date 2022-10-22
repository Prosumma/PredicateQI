//
//  Object.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-15.
//

import Foundation

@dynamicMemberLookup
public struct Object<O: NSObject>: Expression, Variable {
  public let pqiExpression: NSExpression
  
  public init(_ expression: NSExpression = NSExpression.expressionForEvaluatedObject()) {
    pqiExpression = expression
  }
  
  public init(variable: String) {
    self.init(NSExpression(forVariable: variable))
  }
  
  public subscript(index: Int) -> Object<O> {
    .init(pqiExpression ++ index)
  }

  public subscript(index: Index) -> Object<O> {
    .init(pqiExpression ++ index)
  }

  public subscript(size: Size) -> TypedExpression<NSNumber> {
    .init(pqiExpression ++ size)
  }
  
  public subscript<V: NSObject>(dynamicMember keyPath: KeyPath<O, V>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }

  public subscript<V: NSObject>(dynamicMember keyPath: KeyPath<O, V?>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject>(dynamicMember keyPath: KeyPath<O, [V]>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject>(dynamicMember keyPath: KeyPath<O, [V]?>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject>(dynamicMember keyPath: KeyPath<O, Set<V>>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject>(dynamicMember keyPath: KeyPath<O, Set<V>?>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable>(dynamicMember keyPath: KeyPath<O, V>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }

  public subscript<V: NSObject & TypeComparable>(dynamicMember keyPath: KeyPath<O, V?>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable>(dynamicMember keyPath: KeyPath<O, [V]>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable>(dynamicMember keyPath: KeyPath<O, [V]?>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable>(dynamicMember keyPath: KeyPath<O, Set<V>>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable>(dynamicMember keyPath: KeyPath<O, Set<V>?>) -> Object<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: TypeComparable>(dynamicMember keyPath: KeyPath<O, V>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }

  public subscript<V: TypeComparable>(dynamicMember keyPath: KeyPath<O, V?>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: TypeComparable>(dynamicMember keyPath: KeyPath<O, [V]>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: TypeComparable>(dynamicMember keyPath: KeyPath<O, [V]?>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: TypeComparable>(dynamicMember keyPath: KeyPath<O, Set<V>>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: TypeComparable>(dynamicMember keyPath: KeyPath<O, Set<V>?>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable & ScalarComparable>(dynamicMember keyPath: KeyPath<O, V>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }

  public subscript<V: NSObject & TypeComparable & ScalarComparable>(dynamicMember keyPath: KeyPath<O, V?>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable & ScalarComparable>(dynamicMember keyPath: KeyPath<O, [V]>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable & ScalarComparable>(dynamicMember keyPath: KeyPath<O, [V]?>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable & ScalarComparable>(dynamicMember keyPath: KeyPath<O, Set<V>>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }
  
  public subscript<V: NSObject & TypeComparable & ScalarComparable>(dynamicMember keyPath: KeyPath<O, Set<V>?>) -> TypedExpression<V> {
    .init(pqiExpression ++ NSExpression(forKeyPath: keyPath))
  }

  public func subquery(_ builder: (Object<O>) -> PredicateBuilder) -> some Expression {
    precondition(pqiExpression.expressionType != .evaluatedObject, "A subquery cannot be run directly on a root object.")
    let v = "v\(UUID().uuidString.prefix(8).lowercased())"
    let o = Object<O>(variable: v)
    return NSExpression(forSubquery: pqiExpression, usingIteratorVariable: v, predicate: pred(builder(o)))
  }

  public func `where`(_ builder: (Object<O>) -> PredicateBuilder) -> PredicateBuilder {
    subquery(builder).pqiCount > 0
  }

  public func whereNot( builder: (Object<O>) -> PredicateBuilder) -> PredicateBuilder {
    subquery(builder).pqiCount == 0
  }
}

extension Object: TypeComparable {
  public typealias PQIComparisonType = Pointer
}

/**
 A marker protocol which forces an `NSObject` subclass
 to be treated as a scalar instead of an object when
 resolving keypaths in `Object<O>`.
 */
public protocol ScalarComparable {}
extension NSNumber: ScalarComparable {}
