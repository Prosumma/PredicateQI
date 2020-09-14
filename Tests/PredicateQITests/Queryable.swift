//
//  File.swift
//  
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation
import PredicateQI

protocol Queryable: TypeComparable {
  associatedtype QueryIdentifier: KeyPathExpression & TypeComparable & Inconstant where QIComparisonType == Self
}

extension Queryable {
  static var q: QueryIdentifier { .init(identifier: "self", parent: nil) }
}

extension Sequence where Element: Queryable {
  func filter(_ predicate: Predicate) -> [Element] {
    filter(predicate.qiPredicate.evaluate(with:))
  }
  
  func filter(_ predicate: (Element.QueryIdentifier) -> Predicate) -> [Element] {
    filter(predicate(Element.q))
  }
}
