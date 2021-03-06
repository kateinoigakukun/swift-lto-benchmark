set(CMAKE_SHARED_SWIFT_FLAGS "" CACHE STRING "The shared Swift flags")
set(CMAKE_Swift_COMPILER_TARGET "" CACHE STRING "The Swift compile target")

macro(translate_to_absolute_paths result_var sources)
  foreach(file ${sources})
    get_filename_component(file_path ${file} PATH)
    set(tmp_path)
    if(IS_ABSOLUTE "${file_path}")
      set(tmp_path "${file}")
    else()
      set(tmp_path "${CMAKE_CURRENT_SOURCE_DIR}/${file}")
    endif()

    if("${file}" MATCHES "\.filelist$")
      list(APPEND ${result_var} "@${tmp_path}")
    else()
      list(APPEND ${result_var} "${tmp_path}")
    endif()
  endforeach()
endmacro()

function(_emit_swiftmodule name)
  cmake_parse_arguments(
    ESM # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;COMPILE_OPTIONS" # multi-value args
    ${ARGN})
  set(compile_options "${ESM_COMPILE_OPTIONS}")

  set(absolute_source_files)
  translate_to_absolute_paths(absolute_source_files "${ESM_SOURCES}")

  set(dependency_targets)

  foreach(dependency ${ESM_SWIFT_MODULE_DEPENDS})
    set(include_dirs)
    get_target_property(include_dirs ${dependency} INTERFACE_INCLUDE_DIRECTORIES)
    foreach(dir ${include_dirs})
      list(APPEND compile_options "-I${dir}")
    endforeach()
    if (TARGET "${dependency}-swiftmodule")
      list(APPEND dependency_targets "${dependency}-swiftmodule")
    endif()
  endforeach()

  add_custom_command(
    OUTPUT ${name}.swiftmodule
    DEPENDS ${ESM_SOURCES} ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-emit-module"
        "-target" "${CMAKE_Swift_COMPILER_TARGET}"
        "-module-name" "${name}"
        "${CMAKE_SHARED_SWIFT_FLAGS}"
        "-sdk" "$ENV{SDKROOT}"
        "-emit-module-path" "${CMAKE_CURRENT_BINARY_DIR}/${name}.swiftmodule"
        ${absolute_source_files} ${compile_options}
    COMMAND
  )
  add_custom_target(${name}-swiftmodule SOURCES ${name}.swiftmodule)
endfunction()

function(_emit_swift_object name)
  cmake_parse_arguments(
    ESO # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;COMPILE_OPTIONS" # multi-value args
    ${ARGN})
  set(compile_options "${ESO_COMPILE_OPTIONS}")

  set(absolute_source_files)
  translate_to_absolute_paths(absolute_source_files "${ESO_SOURCES}")

  set(dependency_targets)

  foreach(dependency ${ESO_SWIFT_MODULE_DEPENDS})
    set(include_dirs)
    get_target_property(include_dirs ${dependency} INTERFACE_INCLUDE_DIRECTORIES)
    foreach(dir ${include_dirs})
      list(APPEND compile_options "-I${dir}")
    endforeach()
    if (TARGET "${dependency}-swiftmodule")
      list(APPEND dependency_targets "${dependency}-swiftmodule")
    else()
      list(APPEND dependency_targets "${dependency}")
    endif()
  endforeach()

  add_custom_target(${name}.o
    DEPENDS ${ESO_SOURCES} ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-c"
        "-target" "${CMAKE_Swift_COMPILER_TARGET}"
        "${CMAKE_SHARED_SWIFT_FLAGS}"
        "-whole-module-optimization"
        "-module-name" "${name}"
        "-sdk" "$ENV{SDKROOT}"
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}.o"
        ${absolute_source_files} ${compile_options}
  )
  set_target_properties("${name}.o" PROPERTIES
    OBJECT_PATH "${CMAKE_CURRENT_BINARY_DIR}/${name}.o")
endfunction()



function(add_swift_library name)
  cmake_parse_arguments(
    ASL # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;COMPILE_OPTIONS" # multi-value args
    ${ARGN})

  set(compile_options
    ${ASL_COMPILE_OPTIONS}
    "-parse-as-library"
    $<$<CONFIG:MinSizeRel>:"-Osize">
    $<$<CONFIG:Release>:"-O">)
  set(dependency_targets)
  set(self_include_dirs "${CMAKE_CURRENT_BINARY_DIR}")

  foreach(dependency ${ASL_SWIFT_MODULE_DEPENDS})
    get_target_property(include_dirs ${dependency} INTERFACE_INCLUDE_DIRECTORIES)
    foreach(dir ${include_dirs})
      list(APPEND self_include_dirs "${dir}")
    endforeach()

    if (TARGET "${dependency}-swiftmodule")
      list(APPEND dependency_targets "${dependency}-swiftmodule")
    endif()
  endforeach()

  _emit_swiftmodule(${name}
    SOURCES ${ASL_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASL_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS ${compile_options})

  _emit_swift_object(${name}
    SOURCES ${ASL_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASL_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS ${compile_options})

  add_custom_target("${name}"
    DEPENDS ${name}-swiftmodule ${name}.o ${dependency_targets})
  set_target_properties("${name}" PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${self_include_dirs}")
endfunction()

function(add_swift_executable name)
  cmake_parse_arguments(
    ASE # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;LINKER_OPTIONS" # multi-value args
    ${ARGN})  

  set(compile_options
    $<$<CONFIG:MinSizeRel>:"-Osize">
    $<$<CONFIG:Release>:"-O">)

  set(link_objects)
  set(absolute_link_objects)
  foreach(dependency ${ASE_SWIFT_MODULE_DEPENDS})
    list(APPEND link_objects "${dependency}.o")
    set(obj_path)
    get_target_property(obj_path "${dependency}.o" OBJECT_PATH)
    list(APPEND absolute_link_objects ${obj_path})
  endforeach()

  list(APPEND link_objects "${name}.o")
  list(APPEND absolute_link_objects "${CMAKE_CURRENT_BINARY_DIR}/${name}.o")

  _emit_swift_object(${name}
    SOURCES ${ASE_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASE_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS ${compile_options})

  set(driver_options "-toolchain-stdlib-rpath")
  foreach(option ${ASE_LINKER_OPTIONS})
    list(APPEND driver_options "-Xlinker" "${option}")
  endforeach()

  add_custom_target(${name}
    DEPENDS ${link_objects}
    COMMAND
      "${CMAKE_Swift_COMPILER}"
        "-target" "${CMAKE_Swift_COMPILER_TARGET}"
        ${absolute_link_objects}
        ${driver_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}"
  )
endfunction()
