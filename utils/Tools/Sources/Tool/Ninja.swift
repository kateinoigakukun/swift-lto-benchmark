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
