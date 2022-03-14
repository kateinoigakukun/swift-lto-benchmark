cmake_minimum_required(VERSION 3.16)

list(APPEND CMAKE_MODULE_PATH
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")

project(swift-lto-benchmark
  LANGUAGES Swift C)

set(SWIFT_LTO TRUE CACHE BOOL "Swift Link time optimization mode")
set(LLVM_LTO  TRUE CACHE BOOL "LLVM Link time optimization mode")
set(ENABLE_HERMETIC_SEAL  TRUE CACHE BOOL "hermetic-seal-at-link")
set(SWIFT_BUILD_DIR "" CACHE BOOL "Swift project build directory like path/to/Ninja-ReleaseAssert/swift-macosx-x86_64")
set(LLVM_BUILD_DIR "" CACHE BOOL "LLVM project build directory like path/to/Ninja-ReleaseAssert/llvm-macosx-x86_64")
set(SWIFT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Example/third-party/swift)

include(SwiftSupport)
include(SwiftLTOSupport)
include(${CMAKE_TOOLCHAIN_FILE})

add_subdirectory(lib)
add_subdirectory(Example)

set(EXAMPLE_TARGETS
  SwiftSyntaxExample
  RxSwiftExample
  SwiftStdlibExample
  SwiftNumericsExample)
if("${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin")
  list(APPEND EXAMPLE_TARGETS SwiftyJSONExample)
endif()
add_custom_target(examples DEPENDS ${EXAMPLE_TARGETS})
