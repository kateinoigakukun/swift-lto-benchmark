# SwiftyJSON
set(SwiftyJSON_sources SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift)

if(LTO)
  add_swift_lto_library(SwiftyJSON
    SOURCES ${SwiftyJSON_sources})
else()
  add_library(SwiftyJSON ${SwiftyJSON_sources})
  set_target_properties(SwiftyJSON PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_BINARY_DIR}")
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

if(LTO)
  add_swift_lto_library(SwiftSyntax
    SOURCES ${SwiftSyntax_sources}
    SWIFT_MODULE_DEPENDS _CSwiftSyntax)
else()
  add_library(SwiftSyntax ${SwiftSyntax_sources})
  target_link_libraries(SwiftSyntax _CSwiftSyntax)
  set_target_properties(SwiftSyntax PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_BINARY_DIR}")
endif()
