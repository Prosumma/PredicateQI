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
  static func qi(identifier: CIdentifier = .SELF) -> QIType {
    .init(identifier: identifier, parent: nil)
  }
  
  static var qi: QIType {
    qi()
  }
}

public extension Sequence where Element: Queryable {
  func filter(_ predicate: Predicate) -> [Element] {
    filter(predicate.qiPredicate.evaluate(with:))
  }
  
  func filter(identifier: CIdentifier = .SELF, _ predicate: (Element.QIType) -> Predicate) -> [Element] {
    filter(predicate(Element.qi(identifier: identifier)))
  }
}
