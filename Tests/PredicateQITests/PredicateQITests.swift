import Nimble
import XCTest
@testable import PredicateQI

final class PredicateQITests: XCTestCase {
  func testArraySize() {
    print(Band.qi.members.qiSubquery { any($0.age < 60) }.qiCount)
    print(bands.filter(Band.qi.members.qiSubquery { $0.age < 60 }.qiCount > 2))
  }
}
