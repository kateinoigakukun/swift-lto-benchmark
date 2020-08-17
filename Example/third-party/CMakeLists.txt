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


# ComplexModule from swift-numerics
add_library(_NumericsShims swift-numerics/Sources/_NumericsShims/_NumericsShims.c)
target_include_directories(_NumericsShims PUBLIC swift-numerics/Sources/_NumericsShims/include)

file(GLOB_RECURSE RealModule_sources "swift-numerics/Sources/RealModule/*.swift")
file(GLOB_RECURSE ComplexModule_sources "swift-numerics/Sources/ComplexModule/*.swift")

if(SWIFT_LTO)
  add_swift_lto_library(RealModule
    SOURCES ${RealModule_sources}
    SWIFT_MODULE_DEPENDS _NumericsShims)
  add_swift_lto_library(ComplexModule
    SOURCES ${ComplexModule_sources}
    SWIFT_MODULE_DEPENDS RealModule _NumericsShims)
elseif(LLVM_LTO)
  add_swift_llvm_lto_library(RealModule
    SOURCES ${RealModule_sources}
    SWIFT_MODULE_DEPENDS _NumericsShims)
  add_swift_llvm_lto_library(ComplexModule
    SOURCES ${ComplexModule_sources}
    SWIFT_MODULE_DEPENDS RealModule _NumericsShims)
else()
  add_swift_library(RealModule
    SOURCES ${RealModule_sources}
    SWIFT_MODULE_DEPENDS _NumericsShims)
  add_swift_library(ComplexModule
    SOURCES ${ComplexModule_sources}
    SWIFT_MODULE_DEPENDS RealModule _NumericsShims)
endif()


# stdlib
configure_file(swift-stdlib.filelist.in ${CMAKE_CURRENT_BINARY_DIR}/swift-stdlib.filelist)
set(Swift_sources ${CMAKE_CURRENT_BINARY_DIR}/swift-stdlib.filelist)
if("${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin")
  set(Swift_compile_options
    -resource-dir ${SWIFT_BUILD_DIR}/lib/swift
    -D INTERNAL_CHECKS_ENABLED
    -D SWIFT_ENABLE_RUNTIME_FUNCTION_COUNTERS
    -D SWIFT_ENABLE_EXPERIMENTAL_DIFFERENTIABLE_PROGRAMMING
    -module-cache-path ${SWIFT_BUILD_DIR}/module-cache
    -enable-objc-interop
    -disable-objc-attr-requires-foundation-module
    -enable-library-evolution
    -enforce-exclusivity=unchecked
    -nostdimport
    -parse-stdlib
    -group-info-path
    ${SWIFT_SOURCE_DIR}/stdlib/public/core/GroupInfo.json
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
    -I ${SWIFT_BUILD_DIR}/lib/swift/macosx)
else()
  set(Swift_compile_options
    -resource-dir ${SWIFT_BUILD_DIR}/lib/swift
    -D INTERNAL_CHECKS_ENABLED
    -D SWIFT_ENABLE_RUNTIME_FUNCTION_COUNTERS
    -D SWIFT_ENABLE_EXPERIMENTAL_DIFFERENTIABLE_PROGRAMMING
    -module-cache-path ${SWIFT_BUILD_DIR}/module-cache
    -enable-library-evolution
    -enforce-exclusivity=unchecked
    -nostdimport
    -parse-stdlib
    -module-name Swift
    -group-info-path
    ${SWIFT_SOURCE_DIR}/stdlib/public/core/GroupInfo.json
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
    -parse-as-library
    -I ${SWIFT_BUILD_DIR}/lib/swift/linux/x86_64)
endif()
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
