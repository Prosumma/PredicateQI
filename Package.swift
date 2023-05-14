// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PredicateQI",
  platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
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
      dependencies: ["PredicateQI"]
    )
  ],
  swiftLanguageVersions: [.v5]
)
