//
//  File.swift
//  
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

public func and<Predicates: Sequence>(_ predicates: Predicates) -> Predicate where Predicates.Element == Predicate {
  NSCompoundPredicate(andPredicateWithSubpredicates: predicates.map(\.qiPredicate))
}

public func and(_ predicates: Predicate...) -> Predicate {
  and(predicates)
}

public func &&<L: Predicate, R: Predicate>(lhs: L, rhs: R) -> Predicate {
  and(lhs, rhs)
}

public func or<Predicates: Sequence>(_ predicates: Predicates) -> Predicate where Predicates.Element == Predicate {
  NSCompoundPredicate(orPredicateWithSubpredicates: predicates.map(\.qiPredicate))
}

public func or(_ predicates: Predicate...) -> Predicate {
  or(predicates)
}

public func ||<L: Predicate, R: Predicate>(lhs: L, rhs: R) -> Predicate {
  or(lhs, rhs)
}

public func not(_ predicate: Predicate) -> Predicate {
  NSCompoundPredicate(notPredicateWithSubpredicate: predicate.qiPredicate)
}

public prefix func !(_ predicate: Predicate) -> Predicate {
  not(predicate)
}
