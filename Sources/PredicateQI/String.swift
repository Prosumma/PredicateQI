//
//  String.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-13.
//

public extension String {
  func qiAssertCStyleIdentifier() {
    guard nil != range(of: "^[a-zA-Z_][a-zA-Z0-9_]*$", options: .regularExpression, range: nil, locale: nil) else {
      return assertionFailure("\(self) is not a C-style identifier.")
    }
  }
}

extension String: TypeComparable {}
extension String: ConstantExpression {}
