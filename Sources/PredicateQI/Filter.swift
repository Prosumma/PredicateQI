//
//  Filter.swift
//  PredicateQI
//
//  Created by Greg Higley on 2022-10-15.
//

import Foundation

public protocol Filter: Sequence where Element: NSObject {
  func pqiFilter(_ predicate: NSPredicate) -> Self
}

public extension Filter {
  func pqiFilter(_ builder: PredicateBuilder) -> Self {
    pqiFilter(pred(builder))
  }
  func pqiFilter(_ builder: (Object<Element>) -> PredicateBuilder) -> Self {
    pqiFilter(builder(.init()))
  }
}

extension Array: Filter where Element: NSObject {
  public func pqiFilter(_ predicate: NSPredicate) -> [Element] {
    filter(predicate.evaluate(with:))
  }
}

extension Set: Filter where Element: NSObject {
  public func pqiFilter(_ predicate: NSPredicate) -> Set<Element> {
    filter(predicate.evaluate(with:))
  }
}
