//
//  RandomVariable.swift
//  PredicateQI
//
//  Created by Gregory Higley on 2020-09-14.
//

import Foundation

public func randomVariable() -> String {
  let uuid = UUID().uuidString
  return "v" + uuid[uuid.index(uuid.endIndex, offsetBy: -8)..<uuid.endIndex].lowercased()
}
