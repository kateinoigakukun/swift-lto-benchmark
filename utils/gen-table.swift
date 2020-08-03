import Foundation

let projectDirectory = URL(fileURLWithPath: #file)
  .deletingLastPathComponent()
  .deletingLastPathComponent()

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

func benchmarkTable(target: Target) throws -> String {
  func row(opt: OptVariant) throws -> String {
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

  return """
<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=\(LTOVariant.allCases.count)>Size</td>
</tr>
<tr>
    \(LTOVariant.allCases.map { "<td>\($0)</td>" }.joined(separator: "\n    "))
</tr>
\(try OptVariant.allCases.map(row).joined(separator: "\n"))
</table>
"""
}

for target in Target.allCases {
  print("### \(target)")
  print(try benchmarkTable(target: target))
  print("\n")
}
