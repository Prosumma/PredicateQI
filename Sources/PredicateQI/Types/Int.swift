//
//  Int.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

import Foundation

extension Int: TypeComparable {
  public typealias QIComparisonType = NSNumber
}

extension Int: ConstantExpression {}
