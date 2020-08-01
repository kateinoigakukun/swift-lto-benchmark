include(SwiftLTOSupport)

add_subdirectory(third-party)

set(sources SwiftyJSONExample.swift)

if(LTO)
  add_swift_lto_executable(SwiftyJSONExample
    SOURCES ${sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)
else()
  add_executable(SwiftyJSONExample ${sources})
  target_link_libraries(SwiftyJSONExample SwiftyJSON)
endif()