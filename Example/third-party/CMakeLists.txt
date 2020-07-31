add_library(SwiftyJSON
  SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift)
add_custom_command(
  OUTPUT SwiftyJSON.sib SwiftyJSON.swiftmodule.summary
  DEPENDS SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift
  COMMAND
    "${CMAKE_Swift_COMPILER}" "-emit-sib" "-O"
      "SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift"
      "-emit-module-summary-path" "${CMAKE_BINARY_DIR}/third-party/SwiftyJSON.swiftmodule.summary"
)

set_target_properties(SwiftyJSON PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_BINARY_DIR}/third-party")
