// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PredicateQI",
  platforms: [.macOS(.v12), .iOS(.v16), .tvOS(.v15), .watchOS(.v8)],
  products: [
    .library(
      name: "PredicateQI",
      targets: ["PredicateQI"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "PredicateQI",
      dependencies: [],
      exclude: ["Comparison.swift.gyb", "Object.swift.gyb"]
    ),
    .testTarget(
      name: "PredicateQITests",
      dependencies: ["PredicateQI"],
      resources: [.copy("Houses.xcdatamodeld")]
    )
  ]
)
