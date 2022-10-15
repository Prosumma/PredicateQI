//
//  PredicateLogic.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public func and(_ lhs: @escaping PredicateBuilder, _ rhs: @escaping PredicateBuilder) -> PredicateBuilder {
  return { context in
    let lp = lhs(context)
    let rp = rhs(context)
    return NSCompoundPredicate(type: .and, subpredicates: [lp, rp])
  }
}

public func && (lhs: @escaping PredicateBuilder, rhs: @escaping PredicateBuilder) -> PredicateBuilder {
  and(lhs, rhs)
}

public func or(_ lhs: @escaping PredicateBuilder, _ rhs: @escaping PredicateBuilder) -> PredicateBuilder {
  return { context in
    let lp = lhs(context)
    let rp = rhs(context)
    return NSCompoundPredicate(type: .or, subpredicates: [lp, rp])
  }
}

public func || (lhs: @escaping PredicateBuilder, rhs: @escaping PredicateBuilder) -> PredicateBuilder {
  or(lhs, rhs)
}

public func not(_ builder: @escaping PredicateBuilder) -> PredicateBuilder {
  return { context in
    let p = builder(context)
    return NSCompoundPredicate(type: .not, subpredicates: [p])
  }
}

public prefix func ! (builder: @escaping PredicateBuilder) -> PredicateBuilder {
  not(builder)
}
