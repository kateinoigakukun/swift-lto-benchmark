# SwiftyJSON
set(SwiftyJSON_sources SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift)

if(SWIFT_LTO)
  add_swift_lto_library(SwiftyJSON
    SOURCES ${SwiftyJSON_sources})
elseif(LLVM_LTO)
  add_swift_llvm_lto_library(SwiftyJSON
    SOURCES ${SwiftyJSON_sources})
else()
  add_swift_library(SwiftyJSON
    SOURCES ${SwiftyJSON_sources})
endif()

# SwiftSyntax
add_library(_CSwiftSyntax swift-syntax/Sources/_CSwiftSyntax/src/atomic-counter.c)
target_compile_options(_CSwiftSyntax PRIVATE "-fmodules" "-fmodule-name=_CSwiftSyntax")
target_include_directories(_CSwiftSyntax PRIVATE swift-syntax/Sources/_CSwiftSyntax/include)
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/_CSwiftSyntax/module.modulemap" "
module _CSwiftSyntax {
  umbrella \"${CMAKE_CURRENT_SOURCE_DIR}/swift-syntax/Sources/_CSwiftSyntax/include\"
  export *
}
")
set(_CSwiftSyntax_include_directories
  "${CMAKE_CURRENT_BINARY_DIR}/_CSwiftSyntax"
  "/Applications/Xcode-11.5.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift")
set_target_properties(_CSwiftSyntax PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_CSwiftSyntax_include_directories}")
file(GLOB_RECURSE SwiftSyntax_sources "swift-syntax/Sources/SwiftSyntax/*.swift")

if(SWIFT_LTO)
  add_swift_lto_library(SwiftSyntax
    SOURCES ${SwiftSyntax_sources}
    SWIFT_MODULE_DEPENDS _CSwiftSyntax)
elseif(LLVM_LTO)
  add_swift_llvm_lto_library(SwiftSyntax
    SOURCES ${SwiftSyntax_sources}
    SWIFT_MODULE_DEPENDS _CSwiftSyntax)
else()
  add_swift_library(SwiftSyntax
    SOURCES ${SwiftSyntax_sources}
    SWIFT_MODULE_DEPENDS _CSwiftSyntax)
endif()

# RxSwift
file(GLOB_RECURSE RxSwift_sources "RxSwift/Sources/RxSwift/*.swift")

if(SWIFT_LTO)
  add_swift_lto_library(RxSwift
    SOURCES ${RxSwift_sources})
elseif(LLVM_LTO)
  add_swift_llvm_lto_library(RxSwift
    SOURCES ${RxSwift_sources})
else()
  add_swift_library(RxSwift
    SOURCES ${RxSwift_sources})
endif()