include(SwiftLTOSupport)

add_subdirectory(third-party)

set(xcode_toolchain /Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr)

set(SwiftyJSONExample_sources SwiftyJSONExample.swift)

set(SwiftSyntaxExample_sources SwiftSyntaxExample.swift)
set(SwiftSyntaxExample_linker_options
  "-L${xcode_toolchain}/lib/swift/macosx/"
  "-L${CMAKE_CURRENT_BINARY_DIR}/third-party"
  "-l_CSwiftSyntax"
  "-l_InternalSwiftSyntaxParser"
  "-rpath" "${xcode_toolchain}/lib/swift/macosx")

set(RxSwiftExample_sources RxSwiftExample.swift)

if(SWIFT_LTO AND LLVM_LTO)
  add_swift_llvm_lto_executable(SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)

  add_swift_llvm_lto_executable(SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax
    LINKER_OPTIONS ${SwiftSyntaxExample_linker_options})

  add_swift_llvm_lto_executable(RxSwiftExample
    SOURCES ${RxSwiftExample_sources}
    SWIFT_MODULE_DEPENDS RxSwift)
elseif(SWIFT_LTO)
  add_swift_lto_executable(SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)

  add_swift_lto_executable(SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax
    LINKER_OPTIONS ${SwiftSyntaxExample_linker_options})

  add_swift_lto_executable(RxSwiftExample
    SOURCES ${RxSwiftExample_sources}
    SWIFT_MODULE_DEPENDS RxSwift)
elseif(LLVM_LTO)
  add_llvm_lto_executable(SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)

  add_llvm_lto_executable(SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax
    LINKER_OPTIONS ${SwiftSyntaxExample_linker_options})

  add_llvm_lto_executable(RxSwiftExample
    SOURCES ${RxSwiftExample_sources}
    SWIFT_MODULE_DEPENDS RxSwift)
else()
  add_swift_executable(SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)

  add_swift_executable(SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax
    LINKER_OPTIONS ${SwiftSyntaxExample_linker_options})

  add_swift_executable(RxSwiftExample
    SOURCES ${RxSwiftExample_sources}
    SWIFT_MODULE_DEPENDS RxSwift)
endif()