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
        .library(
            name: "M7NativeFirebase",
            targets: ["M7Native", "M7NativeFirebase"]),
    ],
    dependencies: [
        .package(name: "Firebase",
                   url: "https://github.com/firebase/firebase-ios-sdk.git",
                   .branch("6.31-spm-beta")),

        
    ],
    targets: [
        .target(
            name: "M7Native",
            dependencies: []),
        .target(
            name: "M7NativeFirebase",
            dependencies: ["M7Native",
                           .product(name: "Firebase", package: "Firebase"),
                           .product(name: "FirebaseAuth", package: "Firebase"),
                           .product(name: "FirebaseFirestore", package: "Firebase"),
                           .product(name: "FirebaseFirestoreSwift", package: "Firebase"),
            ]),
        .testTarget(
            name: "M7NativeTests",
            dependencies: ["M7Native"]),
    ]
)
