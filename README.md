# PredicateQI

PredicateQI (PQI) is a framework which provides a domain-specific language (DSL) for building `NSPredicate` instances in Swift.  

Apple's [predicate language](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html) is a small language used primarily for two purposes. First, to query local managed data stores like [Core Data](https://developer.apple.com/documentation/coredata) and [Realm](https://realm.github.io) and second to query arrays of Objective-C objects.

To use PredicateQI with Core Data, see [CoreDataQueryInterface](https://github.com/prosumma/CoreDataQueryInterface), which builds on PQI to create a Swift DSL for Core Data.

## Examples

PQI is straightforward (but be sure to read "Notes &amp; Limitations" below). A simple example follows and many more can be found in the tests.

```swift
@objcMembers
class Person: NSObject {
  let firstName: String
  let lastName: String
}

@objcMembers
class House: NSObject {
  let address: String?
  let inhabitants: NSArray
}

let houses: [House] = …
let inhabitedHouses = houses.pqiFilter { $0.inhabitants.pqiCount > 0 }
let smithHouse = houses.pqiFilter { any($0.inhabitants[Person.self].lastName == "Smith" )}.first
```

## Notes &amp; Limitations

### Mixed Support

`NSPredicate` is a high-level language that can be executed directly against Objective-C objects in memory or possibly compiled to a different language such as SQL, as is the case with Core Data. As a result, not every `NSPredicate` is valid in every circumstance. Sometimes, a predicate that works with Objective-C objects won't work with Core Data and vice versa, because of different underlying capabilities. The mere fact that a predicate can be produced does not mean that it will work. PQI gives excellent guidance on creating valid predicates, but just because something compiles does not mean it will work when fed to the predicate interpreter.

### Prefixes

PQI makes heavy use of compiler magic involving `KeyPath`s and `@dynamicMemberLookup`, but it also needs to add methods, properties and type aliases to arbitrary existing user types. To avoid naming collisions, PQI uses the `pqi` prefix unless there is no possibility of confusion. 

For example, to present the `@count` aggregate operator, the `pqiCount` property is provided. It's named this way to avoid any possibility of collision with an already existing property called `count`.

PQI also uses the `pqi` prefix for certain global constants such as `pqiSelf` and `pqiCount`.

### Querying Objective-C Objects In Memory

`NSPredicate` understands almost any type which can be represented in Objective-C. Just use `@objcMembers` on your class or prefix your instance variables with `@objc`. If it can't be represented, the compiler will immediately complain.

Unfortunately, this means that the Swift collection types can't be used. Nor can scalar optionals such as `Int?` or `Double?` (but `String?` works).

PQI provides a feature called _type subscripts_ which can help with this. In the example above, `inhabitants` cannot be of type `[Person]` because `NSPredicate` wouldn't like that. It must be an `NSArray`. Unfortunately, this means that the compiler can't see inside `NSArray` and tell us what type it contains, so we can't produce a keypath. Type subscripts fix this:

```swift
let smithHouse = houses.pqiFilter { any($0.inhabitants[Person.self].lastName == "Smith") }
```

Without a type subscript on `inhabitants`, the compiler could not see that `lastName` exists, and the code above would not compile.

### Querying Core Data

Read the section on querying Objective-C objects in memory above. Much of what it says still applies to Core Data, but with a few happy exceptions. When used with Core Data, `NSPredicate` is first compiled to SQL and executed against the underlying SQLite store. This means that it has slightly different (and in most cases more powerful) capabilities. In addition, the list of types supported by `@NSManaged` is greater. `@objc var strings: [String]` will fail to build, but `@NSManaged var strings: [String]` will work.