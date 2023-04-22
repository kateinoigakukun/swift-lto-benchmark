// swift-tools-version:5.5

import PackageDescription
import Foundation

func allFiles(exceptFor path: String) -> [String] {
    return try! FileManager.default.contentsOfDirectory(atPath: ".").filter {
        $0 != path
    }
}

let package = Package(
  name: "Examples",
  dependencies: [
    .package(path: "./third-party/SwiftyJSON"),
  ],
  targets: [
    .executableTarget(name: "SwiftyJSONExample", dependencies: ["SwiftyJSON", "Benchmark"]),
    .target(name: "Benchmark", dependencies: [], exclude: ["CMakeLists.txt"]),
  ]
)
