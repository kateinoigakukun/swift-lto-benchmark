
import Foundation

let projectDirectory = URL(fileURLWithPath: #file)
  .deletingLastPathComponent()
  .deletingLastPathComponent()
  .deletingLastPathComponent()
  .deletingLastPathComponent()
  .deletingLastPathComponent()


func runtimePerformanceTable(target: Target, opt: OptVariant) throws -> String {
  func valuesForResult(_ result: BenchmarkResult) -> [String] {
    let samples = result.samples.sorted()
    func median() -> Double {
      let index = Swift.max(0, Int((Double(samples.count) * 0.5).rounded(.up)) - 1)
      return samples[index]
    }
    let stats = result.samples.reduce(into: Stats(), Stats.collect)
    let values: [String] = [
      samples.first!,
      samples.last!,
      stats.mean.rounded(),
      stats.standardDeviation.rounded(),
      median(),
    ].map { String(format: "%.1f", $0) }
    + [String(result.maxRSS)]
    return values
  }

  func row(_ lto: LTOVariant) throws -> String {
    let variant: Variant = (lto, opt)
    let result = try runtimePerformance(target: target, variant: variant)
    let values = valuesForResult(result)
    return """
<tr>
  <td>\(lto)</td>
  \(values.map { "<td>\($0)</td>" }.joined(separator: "\n    "))
</tr>
"""
  }
  
  let headers = ["MIN", "MAX", "MEAN", "SD", "MEDIAN", "MAX_RSS(B)"]
  return """
<table>
<tr><td colspan=7>\(opt)</td></tr>
<tr>
  <td>Variant</td>
  \(headers.map { "<td>\($0)</td>" }.joined())
</tr>
\(try LTOVariant.allCases.map(row).joined(separator: "\n"))
</table>
"""
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
    \(try OptVariant.allCases.map(buildTimeRow).joined(separator: "\n    "))
</table>

#### Runtime Performance
\(
  try OptVariant.allCases.map {
    try runtimePerformanceTable(target: target, opt: $0)
  }
  .joined(separator: "\n\n")
)
"""
}

for target in Target.allCases {
  print("### \(target)")
  print(try benchmarkTable(target: target))
  print("\n")
}
