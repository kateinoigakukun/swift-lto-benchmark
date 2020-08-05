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


# stdlib
set(Swift_sources swift-stdlib.filelist)
set(Swift_compile_options
  -sdk /Applications/Xcode-12-beta3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk
  -target x86_64-apple-macosx10.9
  -resource-dir /Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/swift-macosx-x86_64/./lib/swift
  -F/Applications/Xcode-12-beta3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk/../../../Developer/Library/Frameworks
  -D INTERNAL_CHECKS_ENABLED
  -D SWIFT_ENABLE_RUNTIME_FUNCTION_COUNTERS
  -D SWIFT_ENABLE_EXPERIMENTAL_DIFFERENTIABLE_PROGRAMMING
  -module-cache-path /Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/swift-macosx-x86_64/./module-cache
  -enable-objc-interop
  -disable-objc-attr-requires-foundation-module
  -enable-library-evolution
  -enforce-exclusivity=unchecked
  -nostdimport
  -parse-stdlib
  -group-info-path
  /Users/kateinoigakukun/projects/swift-source-2/swift/stdlib/public/core/GroupInfo.json
  -swift-version 5
  -runtime-compatibility-version none
  -disable-autolinking-runtime-compatibility-dynamic-replacements
  -warn-swift3-objc-inference-complete
  -verify-syntax-tree
  -Xllvm -sil-inline-generics
  -Xllvm -sil-partial-specialization
  -enable-experimental-concise-pound-file
  -Xcc -DswiftCore_EXPORTS
  -warn-implicit-overrides
  -module-link-name swiftCore
  -whole-module-optimization
  -save-optimization-record=bitstream
  -parse-as-library
  -I /Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/swift-macosx-x86_64/./lib/swift/macosx)
set(Swift_args Swift
    SOURCES ${Swift_sources}
    COMPILE_OPTIONS ${Swift_compile_options})
if(SWIFT_LTO)
  add_swift_lto_library(${Swift_args})
elseif(LLVM_LTO)
  add_swift_llvm_lto_library(${Swift_args})
else()
  add_swift_library(${Swift_args})
endif()