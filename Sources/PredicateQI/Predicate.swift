//
//  Predicate.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

public protocol Predicate {
  var qiPredicate: NSPredicate { get }
}

extension NSPredicate: Predicate {
  public var qiPredicate: NSPredicate { self }
}
