
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
    func median() -> Int {
      let index = Swift.max(0, Int((Double(samples.count) * 0.5).rounded(.up)) - 1)
      return samples[index]
    }
    let stats = result.samples.reduce(into: Stats(), Stats.collect)
    let values: [Int] = [
      samples.first!,
      samples.last!,
      Int(stats.mean.rounded()),
      Int(stats.standardDeviation.rounded()),
      median(),
      result.maxRSS
    ]
    return values.map { String($0) }
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
<tr><td colspan=6>\(opt)</td></tr>
<tr>\(headers.map { "<td>\($0)</td>" })</tr>
\(try LTOVariant.allCases.map(row).joined(separator: "\n"))
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
