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

typealias Variant = (lto: LTOVariant, opt: OptVariant)


enum Target: String, CaseIterable {
  case SwiftStdlib
  case SwiftyJSON
  case SwiftSyntax
  case SwiftNumerics
  case RxSwift

  func isRelated(to ninjaTarget: String) -> Bool {
    switch self {
    case .SwiftyJSON, .SwiftSyntax, .RxSwift:
      return ninjaTarget.contains(self.rawValue)
    case .SwiftStdlib:
      return ninjaTarget.hasPrefix("Swift.") ||
        ninjaTarget.contains(self.rawValue)
    case .SwiftNumerics:
      return ninjaTarget.hasPrefix("ComplexModule.") ||
        ninjaTarget.contains(self.rawValue)
    }
  }
}
