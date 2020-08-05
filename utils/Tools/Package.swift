// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tools",
    platforms: [.macOS(.v10_13)],
    products: [
        .executable(name: "tool", targets: ["Tool"]),
    ],
    targets: [
        .target(name: "Tool", dependencies: []),
    ]
)
