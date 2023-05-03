// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSense",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftSense",
            targets: ["SwiftSense"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // Swift DocC dependencies
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.2.0"),
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftSense",
            dependencies: []),
        .testTarget(
            name: "SwiftSenseTests",
            dependencies: ["SwiftSense"]),
    ]
)
