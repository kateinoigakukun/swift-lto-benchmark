include(SwiftSupport)

set(CMAKE_SWIFT_LINKER "" CACHE FILEPATH "The Swift linker")
set(CMAKE_SWIFT_LINKER_FLAGS "" CACHE STRING "The Swift linker flags")

# Swift LTO

function(_emit_swift_lto_intermediate_files name)
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
  translate_to_absolute_paths(absolute_source_files "${ESLIF_SOURCES}")

  set(dependency_targets)

  foreach(dependency ${ESLIF_SWIFT_MODULE_DEPENDS})
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
    OUTPUT ${lto_intermediate_files}
    DEPENDS ${ESLIF_SOURCES} ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-emit-sib"
        "-target" "${CMAKE_SWIFT_TARGET}"
        "${CMAKE_SHARED_SWIFT_FLAGS}"
        "-module-name" "${name}"
        "-sdk" "$ENV{SDKROOT}"
        "-Xllvm" "-module-summary-embed-debug-name"
        "-emit-module-summary-path"
        "${CMAKE_CURRENT_BINARY_DIR}/${name}.swiftmodule.summary"
        ${absolute_source_files} ${compile_options}
  )

  add_custom_target(${name}-raw.sil
    DEPENDS ${ESLIF_SOURCES} ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-emit-sil"
        "-module-name" "${name}"
        "-sdk" "$ENV{SDKROOT}"
        ${absolute_source_files} ${compile_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}-raw.sil"
  )

  add_custom_target(${name}-raw.ll
    DEPENDS ${ESLIF_SOURCES} ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-emit-ir"
        "-module-name" "${name}"
        "-sdk" "$ENV{SDKROOT}"
        ${absolute_source_files} ${compile_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}-raw.ll"
  )

  add_custom_target(${name}-raw.o
    DEPENDS ${ESLIF_SOURCES} ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-c"
        "-module-name" "${name}"
        "-sdk" "$ENV{SDKROOT}"
        ${absolute_source_files} ${compile_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}-raw.o"
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
    "SOURCES;SWIFT_MODULE_DEPENDS;COMPILE_OPTIONS" # multi-value args
    ${ARGN})

  set(compile_options
    ${ASLL_COMPILE_OPTIONS}
    "-parse-as-library"
    $<$<CONFIG:MinSizeRel>:"-Osize">
    $<$<CONFIG:Release>:"-O">)
  set(dependency_targets)
  set(self_include_dirs "${CMAKE_CURRENT_BINARY_DIR}")

  foreach(dependency ${ASLL_SWIFT_MODULE_DEPENDS})
    get_target_property(include_dirs ${dependency} INTERFACE_INCLUDE_DIRECTORIES)
    foreach(dir ${include_dirs})
      list(APPEND self_include_dirs "${dir}")
    endforeach()

    if (TARGET "${dependency}")
      list(APPEND dependency_targets "${dependency}")
    endif()
  endforeach()

  _emit_swiftmodule(${name}
    SOURCES ${ASLL_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLL_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS ${compile_options})

  _emit_swift_lto_intermediate_files(${name}
    SOURCES ${ASLL_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLL_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS ${compile_options})

  add_custom_target("${name}"
    DEPENDS ${name}-swiftmodule "${name}_LTO" ${dependency_targets})
  set_target_properties("${name}" PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${self_include_dirs}")
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
        "-module-summary-embed-debug-name"
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
      "${CMAKE_Swift_COMPILER}" "-frontend" "-c" "${sib_path}"
        "-target" "${CMAKE_SWIFT_TARGET}"
        "${CMAKE_SHARED_SWIFT_FLAGS}"
        "-sdk" "$ENV{SDKROOT}"
        "-module-summary-path"
        "${CMAKE_CURRENT_BINARY_DIR}/${LOSO_MERGED_SUMMARY}"
        "-disable-diagnostic-passes"
        ${compile_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${target}.o"
  )

  add_custom_target(${target}-lto.sil
    DEPENDS ${LOSO_MERGED_SUMMARY} ${lto_target}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-emit-sil" "${sib_path}"
        "-module-name" "${target}"
        "-target" "${CMAKE_SWIFT_TARGET}"
	"${options}"
        "-sdk" "$ENV{SDKROOT}"
        "-module-summary-path"
        "${CMAKE_CURRENT_BINARY_DIR}/${LOSO_MERGED_SUMMARY}"
        "-disable-diagnostic-passes"
        ${compile_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${target}-lto.sil"
  )

  add_custom_target(${target}-lto.ll
    DEPENDS ${LOSO_MERGED_SUMMARY} ${lto_target}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-emit-ir" "${sib_path}"
        "-module-name" "${target}"
        "-target" "${CMAKE_SWIFT_TARGET}"
	"${options}"
        "-sdk" "$ENV{SDKROOT}"
        "-module-summary-path"
        "${CMAKE_CURRENT_BINARY_DIR}/${LOSO_MERGED_SUMMARY}"
        "-disable-diagnostic-passes"
        ${compile_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${target}-lto.ll"
  )

endfunction()


function(add_swift_lto_executable name)
  cmake_parse_arguments(
    ASLE # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;LINKER_OPTIONS" # multi-value args
    ${ARGN})  

  _emit_swift_lto_intermediate_files(${name}
    SOURCES ${ASLE_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLE_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS
      $<$<CONFIG:MinSizeRel>:"-Osize">
      $<$<CONFIG:Release>:"-O">)

  _merge_swift_module_summaries(${name}
    SWIFT_MODULES ${ASLE_SWIFT_MODULE_DEPENDS};${name})

  set(dependency_targets)
  set(absolute_link_objects)
  foreach(dependency ${ASLE_SWIFT_MODULE_DEPENDS})
    _lower_and_optimize_sib_to_object(${dependency}
      MERGED_SUMMARY "${name}.swiftmodule.merged-summary")
    list(APPEND dependency_targets "${dependency}.o")
    list(APPEND dependency_targets "${dependency}")
    list(APPEND absolute_link_objects "${CMAKE_CURRENT_BINARY_DIR}/${dependency}.o")
  endforeach()

  _lower_and_optimize_sib_to_object(${name}
    MERGED_SUMMARY "${name}.swiftmodule.merged-summary")
  list(APPEND dependency_targets "${name}.o")
  list(APPEND absolute_link_objects "${CMAKE_CURRENT_BINARY_DIR}/${name}.o")

  set(driver_options "-toolchain-stdlib-rpath")
  foreach(option ${ASLE_LINKER_OPTIONS})
    list(APPEND driver_options "-Xlinker" "${option}")
  endforeach()

  add_custom_target(${name}
    DEPENDS ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}"
        "-target" "${CMAKE_SWIFT_TARGET}"
        ${absolute_link_objects}
        ${driver_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}"
  )
endfunction()



# LLVM LTO

function(_emit_swift_llvm_bc name)
  cmake_parse_arguments(
    ESLB # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;COMPILE_OPTIONS" # multi-value args
    ${ARGN})

  set(compile_options "${ESLB_COMPILE_OPTIONS}")

  set(absolute_source_files)
  translate_to_absolute_paths(absolute_source_files "${ESLB_SOURCES}")

  set(dependency_targets)

  foreach(dependency ${ESLB_SWIFT_MODULE_DEPENDS})
    set(include_dirs)
    get_target_property(include_dirs ${dependency} INTERFACE_INCLUDE_DIRECTORIES)
    foreach(dir ${include_dirs})
      list(APPEND compile_options "-I${dir}")
    endforeach()
    if (TARGET "${dependency}")
      list(APPEND dependency_targets "${dependency}")
    endif()
  endforeach()

  add_custom_target("${name}.bc"
    DEPENDS ${ESLB_SOURCES} ${dependency_targets}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-emit-bc"
        "-module-name" "${name}"
        "-sdk" "$ENV{SDKROOT}"
        "-lto=llvm-full"
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}.bc"
        ${absolute_source_files} ${compile_options}
  )

  set_target_properties("${name}.bc" PROPERTIES
    BITCODE_PATH "${CMAKE_CURRENT_BINARY_DIR}/${name}.bc")
endfunction()


function(add_swift_llvm_lto_library name)
  cmake_parse_arguments(
    ASLL # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;COMPILE_OPTIONS" # multi-value args
    ${ARGN})

  set(compile_options
    ${ASLL_COMPILE_OPTIONS}
    "-parse-as-library"
    $<$<CONFIG:MinSizeRel>:"-Osize">
    $<$<CONFIG:Release>:"-O">)
  set(dependency_targets)
  set(self_include_dirs "${CMAKE_CURRENT_BINARY_DIR}")

  foreach(dependency ${ASLL_SWIFT_MODULE_DEPENDS})
    get_target_property(include_dirs ${dependency} INTERFACE_INCLUDE_DIRECTORIES)
    foreach(dir ${include_dirs})
      list(APPEND self_include_dirs "${dir}")
    endforeach()

    if (TARGET "${dependency}")
      list(APPEND dependency_targets "${dependency}")
    endif()
  endforeach()

  _emit_swiftmodule(${name}
    SOURCES ${ASLL_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLL_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS ${compile_options})

  _emit_swift_llvm_bc(${name}
    SOURCES ${ASLL_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLL_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS ${compile_options})

  add_custom_target("${name}"
    DEPENDS "${name}-swiftmodule" "${name}.bc" ${dependency_targets})
  set_target_properties("${name}" PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${self_include_dirs}")
endfunction()


function(add_llvm_lto_executable name)
  cmake_parse_arguments(
    ASLE # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;LINKER_OPTIONS" # multi-value args
    ${ARGN})

  _emit_swift_llvm_bc(${name}
    SOURCES ${ASLE_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLE_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS
      $<$<CONFIG:MinSizeRel>:"-Osize">
      $<$<CONFIG:Release>:"-O">)

  set(dependency_targets)
  set(absolute_link_objects)
  foreach(dependency ${ASLE_SWIFT_MODULE_DEPENDS})
    list(APPEND dependency_targets "${dependency}.bc" ${dependency})
    set(bc_path)
    get_target_property(bc_path "${dependency}.bc" BITCODE_PATH)
    list(APPEND absolute_link_objects ${bc_path})
  endforeach()

  list(APPEND dependency_targets "${name}.bc")
  set(bc_path)
  get_target_property(bc_path "${name}.bc" BITCODE_PATH)
  list(APPEND absolute_link_objects ${bc_path})

  add_custom_target(${name}
    DEPENDS ${dependency_targets}
    COMMAND
      ${CMAKE_SWIFT_LINKER}
        ${absolute_link_objects}
        ${CMAKE_SWIFT_LINKER_FLAGS}
        ${ASLE_LINKER_OPTIONS}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}"
  )
endfunction()


# Swift and LLVM LTO

function(_lower_and_optimize_sib_to_bc target)
  cmake_parse_arguments(
    LOSB # prefix
    "" # options
    "MERGED_SUMMARY" # single-value args
    "" # multi-value args
    ${ARGN})
  set(lto_target "${target}_LTO")
  set(sib_path)
  get_target_property(sib_path "${lto_target}" SIB_PATH)
  set(compile_options)
  get_target_property(compile_options "${lto_target}" SWIFT_COMPILE_OPTIONS)

  add_custom_target(${target}.bc
    DEPENDS ${LOSB_MERGED_SUMMARY} ${lto_target}
    COMMAND
      "${CMAKE_Swift_COMPILER}" "-frontend" "-emit-bc" "${sib_path}"
        "-target" "${CMAKE_SWIFT_TARGET}"
        "${CMAKE_SHARED_SWIFT_FLAGS}"
        "-sdk" "$ENV{SDKROOT}"
        "-lto=llvm-full"
        "-module-summary-path"
        "${CMAKE_CURRENT_BINARY_DIR}/${LOSB_MERGED_SUMMARY}"
        "-disable-diagnostic-passes"
        ${compile_options}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${target}.bc"
  )
endfunction()

function(add_swift_llvm_lto_executable name)
  cmake_parse_arguments(
    ASLE # prefix
    "" # options
    "" # single-value args
    "SOURCES;SWIFT_MODULE_DEPENDS;LINKER_OPTIONS" # multi-value args
    ${ARGN})

  _emit_swift_lto_intermediate_files(${name}
    SOURCES ${ASLE_SOURCES}
    SWIFT_MODULE_DEPENDS ${ASLE_SWIFT_MODULE_DEPENDS}
    COMPILE_OPTIONS
      $<$<CONFIG:MinSizeRel>:"-Osize">
      $<$<CONFIG:Release>:"-O">)

  _merge_swift_module_summaries(${name}
    SWIFT_MODULES ${ASLE_SWIFT_MODULE_DEPENDS};${name})

  set(dependency_targets)
  set(absolute_link_objects)
  foreach(dependency ${ASLE_SWIFT_MODULE_DEPENDS})
    _lower_and_optimize_sib_to_bc(${dependency}
      MERGED_SUMMARY "${name}.swiftmodule.merged-summary")
    list(APPEND dependency_targets "${dependency}.bc" ${dependency})
    list(APPEND absolute_link_objects "${CMAKE_CURRENT_BINARY_DIR}/${dependency}.bc")
  endforeach()

  _lower_and_optimize_sib_to_bc(${name}
    MERGED_SUMMARY "${name}.swiftmodule.merged-summary")

  list(APPEND dependency_targets "${name}.bc")
  list(APPEND absolute_link_objects "${CMAKE_CURRENT_BINARY_DIR}/${name}.bc")

  add_custom_target(${name}
    DEPENDS ${dependency_targets}
    COMMAND
      ${CMAKE_SWIFT_LINKER}
        ${absolute_link_objects}
        ${CMAKE_SWIFT_LINKER_FLAGS}
        ${ASLE_LINKER_OPTIONS}
        "-o" "${CMAKE_CURRENT_BINARY_DIR}/${name}"
  )
endfunction()
