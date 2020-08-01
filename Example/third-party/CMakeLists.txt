
set(sources SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift)

if(LTO)
  add_swift_lto_library(SwiftyJSON
    SOURCES ${sources})
else()
  add_library(SwiftyJSON ${sources})
  set_target_properties(SwiftyJSON PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_BINARY_DIR}")
endif()