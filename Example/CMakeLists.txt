include(SwiftLTOSupport)

add_subdirectory(third-party)

add_swift_lto_executable(SwiftyJSONExample
  SOURCES SwiftyJSONExample.swift
  SWIFT_MODULE_DEPENDS SwiftyJSON)
