//
//  Filter.swift
//  PredicateQI
//
//  Created by Greg Higley on 2022-10-15.
//

import Foundation

public extension Array {
  func filtered(using builder: PredicateBuilder) -> [Element] {
    let this = self as NSArray
    // swiftlint:disable:next force_cast
    return this.filtered(using: pred(builder)) as! [Element]
  }
}

public extension Set {
  func filtered(using builder: PredicateBuilder) -> Set<Element> {
    let this = self as NSSet
    // swiftlint:disable:next force_cast
    return this.filtered(using: pred(builder)) as! Set<Element>
  }
}
