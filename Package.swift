// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "M7Native",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "M7Native",
            targets: ["M7Native"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "M7Native",
            dependencies: []),
        .testTarget(
            name: "M7NativeTests",
            dependencies: ["M7Native"]),
    ]
)
