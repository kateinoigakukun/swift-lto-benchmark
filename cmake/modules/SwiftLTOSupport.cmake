function(_emit_swift_lto_intermediate_files)
  cmake_parse_arguments(
    ESLIF # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;COMPILE_OPTIONS" # multi-value args
    ${ARGN})

  set(compile_options "${ESLIF_COMPILE_OPTIONS}")

  set(lto_intermediate_files
    "${name}.sib"
    "${name}.swiftmodule.summary")

  set(absolute_source_files)

  foreach(file ${ESLIF_SOURCES})
    get_filename_component(file_path ${file} PATH)
    if(IS_ABSOLUTE "${file_path}")
      list(APPEND absolute_source_files "${file}")
    else()
      list(APPEND absolute_source_files "${CMAKE_CURRENT_SOURCE_DIR}/${file}")
    endif()
  endforeach()

  set(dependency_targets)

  foreach(dependency ${ESLIF_SWIFT_MODULE_DEPENDS})
    set(include_dir)
    get_target_property(include_dir ${dependency} INTERFACE_INCLUDE_DIRECTORIES)
    if(include_dir)
      list(APPEND compile_options "-I${include_dir}")
    endif()
    if (TARGET "${dependency}_ALL")
      list(APPEND dependency_targets "${dependency}_ALL")
    endif()
  endforeach()

  add_custom_command(
    OUTPUT ${lto_intermediate_files}
    DEPENDS ${ESLIF_SOURCES} ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-emit-sib"
        "-Xfrontend" "-emit-module-summary-path"
        "-Xfrontend" "${CMAKE_CURRENT_BINARY_DIR}/${name}.swiftmodule.summary"
        ${absolute_source_files} ${compile_options}
  )

  add_custom_target("${name}_LTO"
    DEPENDS ${lto_intermediate_files})

  set_target_properties("${name}_LTO" PROPERTIES
    SWIFT_MODULE_SUMMARY_PATH "${CMAKE_CURRENT_BINARY_DIR}/${name}.swiftmodule.summary")
  set_target_properties("${name}_LTO" PROPERTIES
    SIB_PATH "${CMAKE_CURRENT_BINARY_DIR}/${name}.sib")
  set_target_properties("${name}_LTO" PROPERTIES
    SWIFT_COMPILE_OPTIONS "${compile_options}")
endfunction()


function(add_swift_lto_library name)
  cmake_parse_arguments(
    ASLL # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS" # multi-value args
    ${ARGN})

  set(compile_options "-parse-as-library")
  set(dependency_targets)

  foreach(dependency ${ASLL_SWIFT_MODULE_DEPENDS})
    if (TARGET "${dependency}_ALL")
      list(APPEND dependency_targets "${dependency}_ALL")
    endif()
  endforeach()

  _emit_swift_lto_intermediate_files(${name}
    SOURCES ${ASLL_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLL_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS ${compile_options})

  add_library(${name} ${ASLL_SOURCES})
  target_link_libraries(${name} ${ASLL_SWIFT_MODULE_DEPENDS})

  set_target_properties(${name} PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_BINARY_DIR}")

  add_custom_target("${name}_ALL"
    DEPENDS ${name} "${name}_LTO" ${dependency_targets})
endfunction()

function(_merge_swift_module_summaries name)
  cmake_parse_arguments(
    MSMS # prefix
    "" # options
    "" # single-value args
    "SWIFT_MODULES" # multi-value args
    ${ARGN})

  set(dependency_targets)
  set(module_summary_files)

  foreach(dependency ${MSMS_SWIFT_MODULES})
    if (TARGET "${dependency}_LTO")
      list(APPEND dependency_targets "${dependency}_LTO")
      set(summary_path)
      get_target_property(summary_path "${dependency}_LTO" SWIFT_MODULE_SUMMARY_PATH)
      list(APPEND module_summary_files "${summary_path}")
    endif()
  endforeach()

  add_custom_target("${name}.swiftmodule.merged-summary"
    DEPENDS "${name}_LTO" ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-cross-module-opt"
        ${module_summary_files}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}.swiftmodule.merged-summary"
  )
endfunction()

function(_lower_and_optimize_sib_to_object target)
  cmake_parse_arguments(
    LOSO # prefix
    "" # options
    "MERGED_SUMMARY" # single-value args
    "" # multi-value args
    ${ARGN})
  set(lto_target "${target}_LTO")
  set(sib_path)
  get_target_property(sib_path "${lto_target}" SIB_PATH)
  set(compile_options)
  get_target_property(compile_options "${lto_target}" SWIFT_COMPILE_OPTIONS)

  add_custom_target(${target}.o
    DEPENDS ${LOSO_MERGED_SUMMARY} ${lto_target}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-c" "${sib_path}"
        "-Xfrontend" "-module-summary-path"
        "-Xfrontend" "${CMAKE_CURRENT_BINARY_DIR}/${LOSO_MERGED_SUMMARY}"
        "-Xfrontend" "-disable-diagnostic-passes"
        "${compile_options}"
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${target}.o"
  )

endfunction()


function(add_swift_lto_executable name)
  cmake_parse_arguments(
    ASLE # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS" # multi-value args
    ${ARGN})  

  _emit_swift_lto_intermediate_files(${name}
    SOURCES ${ASLE_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLE_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS "")

  _merge_swift_module_summaries(${name}
    SWIFT_MODULES ${ASLE_SWIFT_MODULE_DEPENDS};${name})

  set(link_objects)
  set(absolute_link_objects)
  foreach(dependency ${ASLE_SWIFT_MODULE_DEPENDS})
    _lower_and_optimize_sib_to_object(${dependency}
      MERGED_SUMMARY "${name}.swiftmodule.merged-summary")
    list(APPEND link_objects "${dependency}.o")
    list(APPEND absolute_link_objects "${CMAKE_CURRENT_BINARY_DIR}/${dependency}.o")
  endforeach()

  _lower_and_optimize_sib_to_object(${name}
    MERGED_SUMMARY "${name}.swiftmodule.merged-summary")
  list(APPEND link_objects "${name}.o")
  list(APPEND absolute_link_objects "${CMAKE_CURRENT_BINARY_DIR}/${name}.o")

  add_custom_target(${name}
    DEPENDS ${link_objects}
    COMMAND
      "${CMAKE_Swift_COMPILER}"
        ${absolute_link_objects}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}"
  )
endfunction()
