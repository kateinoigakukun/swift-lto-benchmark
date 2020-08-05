cmake_minimum_required(VERSION 3.16)

list(APPEND CMAKE_MODULE_PATH
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")

project(swift-lto-benchmark
  LANGUAGES Swift C)

set(SWIFT_LTO TRUE CACHE BOOL "Swift Link time optimization mode")
set(LLVM_LTO  TRUE CACHE BOOL "LLVM Link time optimization mode")

add_subdirectory(lib)
add_subdirectory(Example)

add_custom_target(examples
  DEPENDS SwiftyJSONExample SwiftSyntaxExample RxSwiftExample SwiftStdlibExample)
