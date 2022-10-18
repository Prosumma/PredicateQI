import XCTest
import CoreData
@testable import PredicateQI

final class PredicateQITests: XCTestCase {
    func testExample() throws {
      let mom = NSManagedObjectModel.mergedModel(from: [Bundle.module])!
      let container = NSPersistentContainer(name: "houses", managedObjectModel: mom)
      container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: URL(fileURLWithPath: "/dev/null"))]
      container.loadPersistentStores { _, error in
        if let error {
          print(error)
        }
      }
      let house = House(context: container.viewContext)
      house.address = "19110"

      let greg = Person(context: container.viewContext)
      greg.name = "Greg"
      greg.age = 55
      greg.house = house

      let belle = Person(context: container.viewContext)
      belle.name = "Belle"
      belle.age = 9
      belle.house = house

      try container.viewContext.save()

      let query = Object<House>()
      let predicate = query.inhabitants.where { $0.age > 1 && $0.name |~> "el" }
      let p = pred(predicate) as! NSComparisonPredicate
      print(p)

      let fetchRequest = NSFetchRequest<House>(entityName: "House")
      fetchRequest.predicate = pred(predicate)

      let houses = try container.viewContext.fetch(fetchRequest)
      print(houses)
    }

  func testFoo() throws {
    let zong = Zong()
    let watusis = [Watusi(zong: zong), Watusi(), Watusi(zong: Zong())]
    let w = Object<Watusi>()
    let p = w.zong == *zong && any(w.zong.vimble <~| [2, 3])
    print(pred(p))
    print(watusis.filtered(using: p))
  }
}

@objcMembers
final class Zong: NSObject {
  let vimble = [0, 2, 3]
}

@objcMembers
final class Watusi: NSObject {
  let zong: Zong?

  init(zong: Zong? = nil) {
    self.zong = zong
  }
}
