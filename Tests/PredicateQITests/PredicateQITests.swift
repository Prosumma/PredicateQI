import Nimble
import XCTest
@testable import PredicateQI

final class PredicateQITests: XCTestCase {
  func testPredicates() {
    let filtered = bands.filter(Band.qi.members.qiSubquery { $0.age < 60 }.qiCount > 2)
    print(filtered.count)
  }
}
