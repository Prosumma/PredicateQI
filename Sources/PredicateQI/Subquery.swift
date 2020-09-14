//
//  Subquery.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public struct SubqueryExpression<Collection: KeyPathExpression & TypeComparable>: Expression, TypeComparable {
  public typealias QIComparisonType = Collection.QIComparisonType
  
  public let collection: Collection
  public let variable: String
  public let predicate: (Collection) -> Predicate
  
  public init(collection: Collection, variable: String, predicate: @escaping (Collection) -> Predicate) {
    self.collection = collection
    self.variable = variable
    self.predicate = predicate
  }
  
  public var qiExpression: NSExpression {
    NSExpression(forSubquery: collection.qiExpression, usingIteratorVariable: variable, predicate: predicate(.init(variable: variable)).qiPredicate)
  }
}

public func subquery<Collection: KeyPathExpression>(collection: Collection, variable: String = randomVariable(), predicate: @escaping (Collection) -> Predicate) -> SubqueryExpression<Collection> {
  SubqueryExpression(collection: collection, variable: variable, predicate: predicate)
}

public extension KeyPathExpression where Self: TypeComparable {
  func qiSubquery(variable: String = randomVariable(), predicate: @escaping (Self) -> Predicate) -> SubqueryExpression<Self> {
    subquery(collection: self, variable: variable, predicate: predicate)
  }
}
