import Nimble
import XCTest
@testable import PredicateQI

final class PredicateQITests: XCTestCase {
  func testAggregate() {
    print(Person.qi.age.qiMin.qiExpression)
  }
}
