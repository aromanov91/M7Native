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
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "M7Native",
            targets: ["M7Native"]),
        .library(
            name: "M7NativeViews",
            targets: ["M7NativeViews"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "M7Native",
            dependencies: []),
        .target(
            name: "M7NativeViews",
            dependencies: ["M7Native"]),
        .testTarget(
            name: "M7NativeTests",
            dependencies: ["M7Native"]),
    ]
)
