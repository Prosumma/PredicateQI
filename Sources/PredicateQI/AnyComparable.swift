//
//  AnyComparable.swift
//  PredicateQI
//
//  Created by Greg Higley on 2022-10-15.
//

import Foundation

public protocol AnyComparable {}

public struct PQISelf: Expression, Variable, AnyComparable {
  public let pqiExpression = NSExpression.expressionForEvaluatedObject()
}

public let pqiSelf = PQISelf()
