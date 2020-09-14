//
//  Queryable.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

public protocol Queryable: TypeComparable {
  associatedtype QIType: KeyPathExpression & TypeComparable & Inconstant where QIComparisonType == Self
}
