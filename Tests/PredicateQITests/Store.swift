//
//  File.swift
//  
//
//  Created by Greg Higley on 2022-10-23.
//

import Foundation

enum Store {
  static let houses = initHouses()
  
  static func initHouses() -> [House] {
    let greg = Person(firstName: "Gregory", lastName: "Higley", age: 91)
    let joe = Person(firstName: "Flavius", lastName: "Josephus", age: 33)
    let fred = Person(firstName: "Friedrich", lastName: "Hayek", age: 80)
    
    let nowhere = House(address: "99 Nowhere St.")
    nowhere.inhabitants.add(greg)
    nowhere.inhabitants.add(joe)
    let somewhere = House(address: "1 Somewhere Rd.")
    somewhere.inhabitants.add(fred)
    return [nowhere, somewhere]
  }
}
