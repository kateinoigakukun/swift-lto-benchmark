include(SwiftLTOSupport)

add_subdirectory(third-party)

set(SwiftyJSONExample_sources SwiftyJSONExample.swift)
set(SwiftSyntaxExample_sources SwiftSyntaxExample.swift)

if(LTO)
  add_swift_lto_executable(SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)

  add_swift_lto_executable(SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax)
else()
  add_executable(SwiftyJSONExample ${SwiftyJSONExample_sources})
  target_link_libraries(SwiftyJSONExample SwiftyJSON)

  add_executable(SwiftSyntaxExample ${SwiftyJSONExample_sources})
  target_link_libraries(SwiftSyntaxExample SwiftSyntax)
endif()