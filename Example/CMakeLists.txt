include(SwiftLTOSupport)

add_subdirectory(third-party)

set(xcode_toolchain /Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr)
set(benchmark_linker_options
  "-rpath" "${CMAKE_CURRENT_BINARY_DIR}/../lib"
  "-L${CMAKE_CURRENT_BINARY_DIR}/../lib"
  "-lBenchmark")

set(SwiftyJSONExample_sources SwiftyJSONExample.swift)
set(SwiftyJSONExample_linker_options ${benchmark_linker_options})
set(SwiftyJSONExample_args SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON
    LINKER_OPTIONS ${SwiftyJSONExample_linker_options})

set(SwiftSyntaxExample_sources SwiftSyntaxExample.swift)
set(SwiftSyntaxExample_linker_options
  ${benchmark_linker_options}
  "-L${xcode_toolchain}/lib/swift/macosx/"
  "-L${CMAKE_CURRENT_BINARY_DIR}/third-party"
  "-l_CSwiftSyntax"
  "-l_InternalSwiftSyntaxParser"
  "-rpath" "${xcode_toolchain}/lib/swift/macosx")
set(SwiftSyntaxExample_args SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax
    LINKER_OPTIONS ${SwiftSyntaxExample_linker_options})

set(RxSwiftExample_sources RxSwiftExample.swift)
set(RxSwiftExample_linker_options ${benchmark_linker_options})
set(RxSwiftExample_args RxSwiftExample
    SOURCES ${RxSwiftExample_sources}
    SWIFT_MODULE_DEPENDS RxSwift
    LINKER_OPTIONS ${RxSwiftExample_linker_options})

if(SWIFT_LTO AND LLVM_LTO)
  add_swift_llvm_lto_executable(${SwiftyJSONExample_args})
  add_swift_llvm_lto_executable(${SwiftSyntaxExample_args})
  add_swift_llvm_lto_executable(${RxSwiftExample_args})
elseif(SWIFT_LTO)
  add_swift_lto_executable(${SwiftyJSONExample_args})
  add_swift_lto_executable(${SwiftSyntaxExample_args})
  add_swift_lto_executable(${RxSwiftExample_args})
elseif(LLVM_LTO)
  add_llvm_lto_executable(${SwiftyJSONExample_args})
  add_llvm_lto_executable(${SwiftSyntaxExample_args})
  add_llvm_lto_executable(${RxSwiftExample_args})
else()
  add_swift_executable(${SwiftyJSONExample_args})
  add_swift_executable(${SwiftSyntaxExample_args})
  add_swift_executable(${RxSwiftExample_args})
endif()