//
//  Double.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-22.
//

import Foundation

extension Double: TypeComparable {
  public typealias QIComparisonType = NSNumber
}

extension Double: ConstantExpression {}
