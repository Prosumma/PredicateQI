//
//  Queryable.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

public protocol Queryable: TypeComparable {
  associatedtype QIType: KeyPathExpression & TypeComparable & Inconstant where QIComparisonType == Self
}

public extension Queryable {
  static var qi: QIType {
    .init()
  }
}

public extension Sequence where Element: Queryable {
  func qiFilter(_ predicate: Predicate) -> [Element] {
    filter(predicate.qiPredicate.evaluate(with:))
  }
  
  func qiFilter(_ predicate: (Element.QIType) -> Predicate) -> [Element] {
    qiFilter(predicate(.init()))
  }
}
