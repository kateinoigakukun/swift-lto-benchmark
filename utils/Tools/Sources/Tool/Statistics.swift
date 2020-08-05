
import Foundation

fileprivate func buildDirectory(variant: Variant) -> URL {
  let dirName = "\(variant.opt)\(variant.lto.directorySuffix)"
  return projectDirectory.appendingPathComponent("build/\(dirName)")
}

fileprivate func artifactPath(target: Target, variant: Variant) -> URL {
  buildDirectory(variant: variant)
    .appendingPathComponent("Example")
    .appendingPathComponent("\(target)Example")
}

func buildTime(target: Target, variant: Variant) throws -> UInt64 {
  let ninjaLogURL = buildDirectory(variant: variant)
    .appendingPathComponent(".ninja_log")
  let ninjaLogContent = try String(contentsOf: ninjaLogURL)
  let log = try parseNinjaLog(ninjaLogContent)
  let targets = log.targets.filter { $0.name.contains(target.rawValue) }
  let start = targets.lazy.map(\.start).min()!
  let end = targets.lazy.map(\.end).max()!
  return end - start
}


func artifactSize(target: Target, variant: Variant) throws -> UInt64 {
  let pathURL = artifactPath(target: target, variant: variant)
  let attr = try FileManager.default.attributesOfItem(atPath: pathURL.path)
  return attr[FileAttributeKey.size] as! UInt64
}

func humanReadableByteCount(bytes: UInt64) -> String {
  if (bytes < 1024) {
      return "\(bytes) B"
  }
  if (bytes < 1000) { return "\(bytes) B" }
  let exp = Int(log2(Double(bytes)) / log2(1024.0))
  let units = ["KB", "MB", "GB", "TB", "PB", "EB"]
  let unit = units[min(exp - 1, units.endIndex - 1)]
  let number = Double(bytes) / pow(1024, Double(exp))
  return String(format: "%.1f %@", number, unit)
}

func humanReadableTime(time: UInt64) -> String {
  return String(format: "%.2f s", Double(time)/1000)
}


struct Stats {
    var n: Int = 0
    var S: Double = 0.0
    var mean: Double = 0.0
    var variance: Double { return n < 2 ? 0.0 : S / Double(n - 1) }
    var standardDeviation: Double { return variance.squareRoot() }

    static func collect(_ s: inout Stats, _ x: Double){
        Stats.runningMeanVariance(&s, x)
    }

    static func runningMeanVariance(_ s: inout Stats, _ x: Double){
        let n = s.n + 1
        let (k, M_, S_) = (Double(n), s.mean, s.S)
        let M = M_ + (x - M_) / k
        let S = S_ + (x - M_) * (x - M)
        (s.n, s.mean, s.S) = (n, M, S)
    }
}

func runtimePerformance(target: Target, variant: Variant) throws -> BenchmarkResult {
  let executable = artifactPath(target: target, variant: variant)
  let process = Process()
  let pipe = Pipe()
  process.executableURL = executable
  process.standardOutput = pipe
  process.environment = [
    "SWIFT_LTO_BENCH_SAMPLES": "100",
    "SWIFT_LTO_BENCH_ITERATIONS": "100",
  ]
  process.launch()
  process.waitUntilExit()
  let outputData = pipe.fileHandleForReading.readDataToEndOfFile()
  return try JSONDecoder().decode(BenchmarkResult.self, from: outputData)
}
