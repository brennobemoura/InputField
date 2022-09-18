// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InputField",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "InputField",
            targets: ["InputField"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "InputField",
            dependencies: []
        ),
        .testTarget(
            name: "InputFieldTests",
            dependencies: ["InputField"]
        )
    ]
)
