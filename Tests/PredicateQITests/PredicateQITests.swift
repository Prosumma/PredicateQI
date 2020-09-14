import Nimble
import XCTest
@testable import PredicateQI

final class PredicateQITests: XCTestCase {
  
  func testRoberts() {
    // Given
    let people = [
      Person(firstName: "Robert", lastName: "Smith", age: 61),
      Person(firstName: "Stephen", lastName: "Morrissey", age: 61),
      Person(firstName: "David", lastName: "Gahan", age: 58)
    ]
    
    // When
    let roberts = people.filter { $0.firstName == "Robert" }
    
    // Then
    expect(roberts.count) == 1
  }

  func testMorrisseys() {
    // Given
    let people = [
      Person(firstName: "Robert", lastName: "Smith", age: 61),
      Person(firstName: "Stephen", lastName: "Morrissey", age: 61),
      Person(firstName: "David", lastName: "Gahan", age: 58)
    ]
    
    // When
    let morrisseys = people.filter(Person.qi.lastName == "Morrissey")
    
    // Then
    expect(morrisseys.count) == 1
  }
  
  func testOld() {
    // Given
    let people = [
      Person(firstName: "Robert", lastName: "Smith", age: 61),
      Person(firstName: "Stephen", lastName: "Morrissey", age: 61),
      Person(firstName: "David", lastName: "Gahan", age: 58)
    ]

    // When
    let oldies = people.filter { $0.age > 59 }
    
    // Then
    expect(oldies.count) == 2
  }
  
  func testDave() {
    // Given
    let people = [
      Person(firstName: "Robert", lastName: "Smith", age: 61),
      Person(firstName: "Stephen", lastName: "Morrissey", age: 61),
      Person(firstName: "David", lastName: "Gahan", age: 58)
    ]

    // When
    let david = people.filter { $0.lastName == "Gahan" && $0.age == 58 }
    
    // Then
    expect(david.count) == 1
  }
    
}
