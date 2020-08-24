
import Foundation

struct MessageError: LocalizedError {
  let errorDescription: String?
  init(_ message: String) {
    errorDescription = message
  }
}

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
  let targets = log.targets.filter { target.isRelated(to: $0.name) }
  let start = targets.lazy.map(\.start).min()!
  let end = targets.lazy.map(\.end).max()!
  return end - start
}


func artifactSize(target: Target, variant: Variant) throws -> UInt64 {
  let pathURL = artifactPath(target: target, variant: variant)
  let process = Process()
  let pipe = Pipe()
  process.launchPath = "/usr/bin/env"
  process.arguments = ["size", pathURL.path]
  process.launch()
  process.waitUntilExit()
  process.standardOutput = pipe
  let stdoutData = pipe.fileHandleForReading.readDataToEndOfFile()
  guard let output = String(data: stdoutData, encoding: .utf8) else {
    throw MessageError("Failed to decode output from size command")
  }
  let lines = output.split(separator: "\n")
  guard lines.count >= 2 else {
    throw MessageError("Invalid output from size command '\(output)'")
  }

  let headers = lines[0].split(separator: "\t")
  let values = lines[1].split(separator: "\t")
  let value: Substring
  #if os(macOS)
  guard let textIndex = headers.firstIndex(where: { $0.contains("__TEXT") }),
        textIndex == headers.startIndex else {
    throw MessageError("Unexpected header output from size command '\(output)'")
  }
  #else
  guard let textIndex = headers.firstIndex(where: { $0.contains("text") }),
        textIndex == headers.startIndex else {
    throw MessageError("Unexpected header output from size command '\(output)'")
  }

  #endif
  value = values[textIndex].filter { $0.isNumber }
  return UInt64(value)!
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
    "SWIFT_LTO_BENCH_SAMPLES": target.samples.description,
    "SWIFT_LTO_BENCH_ITERATIONS": target.iterations.description,
  ]
  process.launch()
  process.waitUntilExit()
  let outputData = pipe.fileHandleForReading.readDataToEndOfFile()
  return try JSONDecoder().decode(BenchmarkResult.self, from: outputData)
}
