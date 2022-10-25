//
//  Operator.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-16.
//

import Foundation

infix operator <~|: ComparisonPrecedence
infix operator |~>: ComparisonPrecedence
infix operator <~%: ComparisonPrecedence
infix operator %~>: ComparisonPrecedence
infix operator <|>: ComparisonPrecedence
infix operator  %*: ComparisonPrecedence
infix operator  %~: ComparisonPrecedence
prefix operator *
postfix operator ^
