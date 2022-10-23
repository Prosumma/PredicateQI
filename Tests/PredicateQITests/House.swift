//
//  House.swift
//  PredicateQITests
//
//  Created by Greg Higley on 2022-10-23.
//

import Foundation

class House: NSObject {
  @objc let address: String?
  @objc var inhabitants: NSMutableArray = []
  
  init(address: String? = nil) {
    self.address = address
  }
}
