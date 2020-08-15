// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Tools",
    platforms: [.macOS(.v10_13)],
    products: [
        .executable(name: "tablegen", targets: ["tablegen"]),
    ],
    targets: [
        .target(name: "tablegen", dependencies: []),
    ]
)
