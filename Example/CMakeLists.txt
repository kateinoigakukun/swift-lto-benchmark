include(SwiftLTOSupport)

add_subdirectory(third-party)

if(LTO)
  add_swift_lto_executable(SwiftyJSONExample
    SOURCES SwiftyJSONExample.swift
    SWIFT_MODULE_DEPENDS SwiftyJSON)
else()
  add_executable(SwiftyJSONExample SwiftyJSONExample.swift)
  target_link_libraries(SwiftyJSONExample SwiftyJSON)
endif()