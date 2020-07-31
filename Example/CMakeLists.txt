add_library(SwiftyJSON
  third-party/SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift)
set_target_properties(SwiftyJSON PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_BINARY_DIR}/Example")
add_executable(SwiftyJSONExample SwiftyJSONExample.swift)
target_link_libraries(SwiftyJSONExample PRIVATE SwiftyJSON)

add_custom_command(
  OUTPUT SwiftyJSON.sib SwiftyJSON.swiftmodule.summary
  DEPENDS third-party/SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift
  COMMAND
    "${CMAKE_Swift_COMPILER}" "-emit-sib"
      "${CMAKE_SOURCE_DIR}/Example/third-party/SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift"
      "-parse-as-library"
      "-Xfrontend" "-emit-module-summary-path"
      "-Xfrontend" "${CMAKE_BINARY_DIR}/Example/SwiftyJSON.swiftmodule.summary"
)


add_custom_command(
  OUTPUT SwiftyJSONExample.sib SwiftyJSONExample.swiftmodule.summary
  DEPENDS SwiftyJSONExample.swift
  COMMAND
    "${CMAKE_Swift_COMPILER}" "-emit-sib"
      "${CMAKE_SOURCE_DIR}/Example/SwiftyJSONExample.swift"
      "-Xfrontend" "-emit-module-summary-path"
      "-Xfrontend" "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample.swiftmodule.summary"
      "-I" "${CMAKE_BINARY_DIR}/Example"
)

add_custom_target(SwiftyJSONExample.merged-summary
  DEPENDS "SwiftyJSONExample.swiftmodule.summary" "SwiftyJSON.swiftmodule.summary" SwiftyJSON
  COMMAND
    "${CMAKE_Swift_COMPILER}" "-cross-module-opt"
      "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample.swiftmodule.summary"
      "${CMAKE_BINARY_DIR}/Example/SwiftyJSON.swiftmodule.summary"
      "-o" "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample.merged-summary"
)


add_custom_target(SwiftyJSON.o
  DEPENDS third-party/SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift
  COMMAND
    "${CMAKE_Swift_COMPILER}" "-c"
      "${CMAKE_SOURCE_DIR}/Example/third-party/SwiftyJSON/Source/SwiftyJSON/SwiftyJSON.swift"
      "-parse-as-library"
      "-o" "${CMAKE_BINARY_DIR}/Example/SwiftyJSON.o"
)

add_custom_target(SwiftyJSON-lto.o
  DEPENDS SwiftyJSONExample.merged-summary SwiftyJSON.sib
  COMMAND
    "${CMAKE_Swift_COMPILER}" "-c"
      "${CMAKE_BINARY_DIR}/Example/SwiftyJSON.sib"
      "-parse-as-library"
      "-module-name" "SwiftyJSON"
      "-Xfrontend" "-module-summary-path"
      "-Xfrontend" "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample.merged-summary"
      "-Xfrontend" "-disable-diagnostic-passes"
      "-o" "${CMAKE_BINARY_DIR}/Example/SwiftyJSON-lto.o"
)

add_custom_target(SwiftyJSONExample-lto.o
  DEPENDS SwiftyJSONExample.merged-summary SwiftyJSONExample.sib
  COMMAND
    "${CMAKE_Swift_COMPILER}" "-c"
      "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample.sib"
      "-module-name" "SwiftyJSONExample"
      "-Xfrontend" "-module-summary-path"
      "-Xfrontend" "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample.merged-summary"
      "-Xfrontend" "-disable-diagnostic-passes"
      "-o" "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample-lto.o"
      "-I" "${CMAKE_BINARY_DIR}/Example"
)


add_custom_target(SwiftyJSONExample-lto
  DEPENDS SwiftyJSONExample-lto.o SwiftyJSON-lto.o
  COMMAND
    "${CMAKE_Swift_COMPILER}"
      "${CMAKE_BINARY_DIR}/Example/SwiftyJSON-lto.o"
      "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample-lto.o"
      "-o" "${CMAKE_BINARY_DIR}/Example/SwiftyJSONExample-lto"
)
