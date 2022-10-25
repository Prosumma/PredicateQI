//
//  PredicateBuilder.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2022-10-14.
//

import Foundation

public struct PredicateContext {
  public var modifier: NSComparisonPredicate.Modifier = .direct
  public var options: NSComparisonPredicate.Options = []
}

public typealias PredicateBuilder = (PredicateContext) -> NSPredicate

public func pred(_ builder: PredicateBuilder) -> NSPredicate {
  let predicate = builder(PredicateContext())
  if PredicateQIConfiguration.logPredicatesToConsole {
    print("PredicateQI: \(predicate)")
  }
  return predicate
}

public func all(_ builder: @escaping PredicateBuilder) -> PredicateBuilder {
  return { context in
    var context = context
    context.modifier = .all
    return builder(context)
  }
}

public func any(_ builder: @escaping PredicateBuilder) -> PredicateBuilder {
  return { context in
    var context = context
    context.modifier = .any
    return builder(context)
  }
}

public func ci(_ builder: @escaping PredicateBuilder) -> PredicateBuilder {
  return { context in
    var context = context
    context.options.insert(.caseInsensitive)
    return builder(context)
  }
}

public func di(_ builder: @escaping PredicateBuilder) -> PredicateBuilder {
  return { context in
    var context = context
    context.options.insert(.diacriticInsensitive)
    return builder(context)
  }
}

public func un(_ builder: @escaping PredicateBuilder) -> PredicateBuilder {
  return { _ in
    builder(PredicateContext())
  }
}
