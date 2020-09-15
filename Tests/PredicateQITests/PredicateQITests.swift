import Nimble
import XCTest
@testable import PredicateQI

final class PredicateQITests: XCTestCase {
  func testPredicates() {
    print(Band.qi.members.qiSubquery { $0.age == nil }.qiCount)
    let filtered = bands.filter { $0.members.qiSubquery { $0.age == nil }.qiCount > 1 }
    print(filtered.count)
  }
}
