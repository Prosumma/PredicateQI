//
//  TypeComparable.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public protocol TypeComparable<PQIComparisonType> {
  associatedtype PQIComparisonType = Self
}
