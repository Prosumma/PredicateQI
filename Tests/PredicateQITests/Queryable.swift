//
//  Queryable.swift
//  
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation
import PredicateQI

extension Queryable {
  static var q: QIType { .init(identifier: "self", parent: nil) }
}

extension Sequence where Element: Queryable {
  func filter(_ predicate: Predicate) -> [Element] {
    filter(predicate.qiPredicate.evaluate(with:))
  }
  
  func filter(_ predicate: (Element.QIType) -> Predicate) -> [Element] {
    filter(predicate(Element.q))
  }
}
