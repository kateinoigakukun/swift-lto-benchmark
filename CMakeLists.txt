cmake_minimum_required(VERSION 3.16)

list(APPEND CMAKE_MODULE_PATH
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")

project(swift-lto-benchmark
  LANGUAGES Swift)

set(LTO TRUE CACHE BOOL "Link time optimization")

add_subdirectory(Example)

add_custom_target(benchmark
  DEPENDS SwiftyJSONExample)