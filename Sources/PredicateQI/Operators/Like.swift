//
//  Like.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

public func like(_ lhs: Expression, _ rhs: Expression) -> ComparisonPredicate {
  ComparisonPredicate(leftExpression: lhs, operator: .like, rightExpression: rhs)
}

public extension Expression where Self: TypeComparable, QIComparisonType == String {
  func qiLike<R: Expression & TypeComparable>(_ rhs: R) -> ComparisonPredicate where R.QIComparisonType == String {
    like(self, rhs)
  }
}
