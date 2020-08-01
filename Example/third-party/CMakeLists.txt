
if(LTO)
  add_swift_lto_library(SwiftyJSON
    SOURCES SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift)
else()
  add_library(SwiftyJSON SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift)
  set_target_properties(SwiftyJSON PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_BINARY_DIR}")
endif()