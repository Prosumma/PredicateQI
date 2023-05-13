//
//  PredicateLogic.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public func and(_ builders: [PredicateBuilder]) -> PredicateBuilder {
  return { context in
    NSCompoundPredicate(type: .and, subpredicates: builders.map { $0(context) })
  }
}

public func and(_ builders: PredicateBuilder...) -> PredicateBuilder {
  and(builders)
}

public func && (lhs: @escaping PredicateBuilder, rhs: @escaping PredicateBuilder) -> PredicateBuilder {
  and(lhs, rhs)
}

public func or(_ builders: [PredicateBuilder]) -> PredicateBuilder {
  return { context in
    NSCompoundPredicate(type: .or, subpredicates: builders.map { $0(context) })
  }
}

public func or(_ builders: PredicateBuilder...) -> PredicateBuilder {
  or(builders)
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
