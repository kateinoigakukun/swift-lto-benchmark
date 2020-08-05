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
  case SwiftyJSON
  case SwiftSyntax
  case RxSwift
}
