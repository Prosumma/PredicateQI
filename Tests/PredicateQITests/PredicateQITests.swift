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
      let predicate = query.inhabitants.where { $0.age < 100 }
      print(pred(predicate))
     
      let fetchRequest = NSFetchRequest<House>(entityName: "House")
      fetchRequest.predicate = pred(predicate)
      
      let houses = try container.viewContext.fetch(fetchRequest)
      print(houses)
    }
}

