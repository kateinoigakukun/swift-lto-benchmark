import Foundation

let projectDirectory = URL(fileURLWithPath: #file)
  .deletingLastPathComponent()
  .deletingLastPathComponent()

struct NinjaLog {
    struct Target {
        let start: UInt64
        let end: UInt64
        let name: String
    }

    let targets: [Target]
}

enum NinjaLogParseError: Error {
    case unrecognizedHeader
    case invalidTargetLine
}

func parseNinjaLog(_ content: String) throws -> NinjaLog {
    var lines = Array(content.split(separator: "\n"))
    guard lines.removeFirst() == "# ninja log v5" else {
        throw NinjaLogParseError.unrecognizedHeader
    }

    let targets = try lines.map { line -> NinjaLog.Target in
        let parts = line.split(separator: "\t")
        guard parts.count == 5 else {
            throw NinjaLogParseError.invalidTargetLine
        }
        return NinjaLog.Target(
            start: UInt64(parts[0])!, end: UInt64(parts[1])!,
            name: String(parts[3])
        )
    }
    return NinjaLog(targets: targets)
}

enum LTOVariant: CustomStringConvertible, CaseIterable {
  case none, Swift, LLVM, SwiftLLVM

  var directorySuffix: String {
    switch self {
    case .none: return ""
    case .Swift: return "-swift-lto"
    case .LLVM: return "-llvm-lto"
    case .SwiftLLVM: return "-swift-llvm-lto"
    }
  }

  var description: String {
    switch self {
    case .none: return "non-LTO"
    case .Swift: return "Swift LTO"
    case .LLVM: return "LLVM LTO"
    case .SwiftLLVM: return "Swift & LLVM LTO"
    }
  }
}

enum OptVariant: String, CaseIterable {
  case Onone, O, Osize
}

enum Target: String, CaseIterable {
  case SwiftyJSON
  case SwiftSyntax
  case RxSwift
}

typealias Variant = (lto: LTOVariant, opt: OptVariant)

func buildDirectory(variant: Variant) -> URL {
  let dirName = "\(variant.opt)\(variant.lto.directorySuffix)"
  return projectDirectory.appendingPathComponent("build/\(dirName)")
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
  let pathURL = buildDirectory(variant: variant)
    .appendingPathComponent("Example")
    .appendingPathComponent("\(target)Example")
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

func benchmarkTable(target: Target) throws -> String {
  func sizeRow(opt: OptVariant) throws -> String {
    let columns = try LTOVariant.allCases.map {
      let variant = ($0, opt)
      let size = try artifactSize(target: target, variant: variant)
      return "<td>\(humanReadableByteCount(bytes: size))</td>"
    }.joined(separator: "\n    ")
    return """
<tr>
    <td>\(opt)</td>
    \(columns)
</tr>
"""
  }

  func buildTimeRow(opt: OptVariant) throws -> String {
    let columns = try LTOVariant.allCases.map {
      let variant = ($0, opt)
      let time = try buildTime(target: target, variant: variant)
      return "<td>\(humanReadableTime(time: time))</td>"
    }.joined(separator: "\n    ")
    return """
<tr>
    <td>\(opt)</td>
    \(columns)
</tr>
"""
  }

  return """
<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=\(LTOVariant.allCases.count)>Size</td>
</tr>
<tr>
    \(LTOVariant.allCases.map { "<td>\($0)</td>" }.joined(separator: "\n    "))
</tr>
\(try OptVariant.allCases.map(sizeRow).joined(separator: "\n"))
</table>

<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=\(LTOVariant.allCases.count)>Build Time</td>
</tr>
<tr>
    \(LTOVariant.allCases.map { "<td>\($0)</td>" }.joined(separator: "\n    "))
</tr>
\(try OptVariant.allCases.map(buildTimeRow).joined(separator: "\n"))
</table>
"""
}

for target in Target.allCases {
  print("### \(target)")
  print(try benchmarkTable(target: target))
  print("\n")
}
