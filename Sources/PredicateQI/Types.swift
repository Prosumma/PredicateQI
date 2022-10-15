//
//  Types.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

extension NSNumber: TypeComparable {}
extension String: TypeComparable {}
extension Bool: TypeComparable {}

extension Int: TypeComparable {
  public typealias PQIComparisonType = NSNumber
}
