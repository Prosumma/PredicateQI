//
//  ComparisonPredicate.swift
//  PredicateQI
//
//  Created by Gregory Higley on 9/13/20.
//

import Foundation

public struct ComparisonPredicate {
  public let leftExpression: Expression
  public let `operator`: NSComparisonPredicate.Operator
  public let rightExpression: Expression
  public var modifier: NSComparisonPredicate.Modifier
  public var options: NSComparisonPredicate.Options
  
  public init(leftExpression: Expression, operator: NSComparisonPredicate.Operator, rightExpression: Expression, modifier: NSComparisonPredicate.Modifier = .direct, options: NSComparisonPredicate.Options = []) {
    self.leftExpression = leftExpression
    self.operator = `operator`
    self.rightExpression = rightExpression
    self.modifier = modifier
    self.options = options
  }
  
  public init(copying: ComparisonPredicate, modifier: NSComparisonPredicate.Modifier = .direct, adding options: NSComparisonPredicate.Options = []) {
    self = copying
    self.modifier = modifier
    self.options = copying.options.union(options)
  }
    
  public func any() -> Predicate {
    ComparisonPredicate(copying: self, modifier: .any)
  }
  
  public func all() -> Predicate {
    ComparisonPredicate(copying: self, modifier: .all)
  }
  
  public func none() -> Predicate {
    !any()
  }
  
  public func caseInsensitive() -> ComparisonPredicate {
    ComparisonPredicate(copying: self, adding: [.caseInsensitive])
  }
  
  public func diacriticInsensitive() -> ComparisonPredicate {
    ComparisonPredicate(copying: self, adding: [.diacriticInsensitive])
  }
  
  public func normalized() -> ComparisonPredicate {
    ComparisonPredicate(copying: self, adding: [.normalized])
  }
}

extension ComparisonPredicate: Predicate {
  public var qiPredicate: NSPredicate {
    NSComparisonPredicate(leftExpression: leftExpression.qiExpression, rightExpression: rightExpression.qiExpression, modifier: modifier, type: `operator`, options: options)
  }
}

public func any(_ predicate: ComparisonPredicate) -> Predicate {
  return predicate.any()
}

public func all(_ predicate: ComparisonPredicate) -> Predicate {
  return predicate.all()
}

public func none(_ predicate: ComparisonPredicate) -> Predicate {
  return predicate.none()
}

public func ci(_ predicate: ComparisonPredicate) -> ComparisonPredicate {
  return predicate.caseInsensitive()
}

public func di(_ predicate: ComparisonPredicate) -> ComparisonPredicate {
  return predicate.diacriticInsensitive()
}

public func n(_ predicate: ComparisonPredicate) -> ComparisonPredicate {
  return predicate.normalized()
}
