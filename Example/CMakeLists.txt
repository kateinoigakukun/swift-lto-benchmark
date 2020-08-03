include(SwiftLTOSupport)

add_subdirectory(third-party)

set(SwiftyJSONExample_sources SwiftyJSONExample.swift)
set(SwiftSyntaxExample_sources SwiftSyntaxExample.swift)
set(RxSwiftExample_sources RxSwiftExample.swift)

if(SWIFT_LTO AND LLVM_LTO)
  add_swift_llvm_lto_executable(SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)

  add_swift_llvm_lto_executable(SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax
    LINKER_OPTIONS
      "-L/Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx/"
      "-L${CMAKE_CURRENT_BINARY_DIR}/third-party"
      "-l_CSwiftSyntax"
      "-l_InternalSwiftSyntaxParser"
      "-rpath" "/Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx")

  add_swift_llvm_lto_executable(RxSwiftExample
    SOURCES ${RxSwiftExample_sources}
    SWIFT_MODULE_DEPENDS RxSwift)
elseif(SWIFT_LTO)
  add_swift_lto_executable(SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)

  add_swift_lto_executable(SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax
    LINKER_OPTIONS
      "-L/Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx/"
      "-L${CMAKE_CURRENT_BINARY_DIR}/third-party"
      "-l_CSwiftSyntax"
      "-l_InternalSwiftSyntaxParser"
      "-rpath" "/Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx")

  add_swift_lto_executable(RxSwiftExample
    SOURCES ${RxSwiftExample_sources}
    SWIFT_MODULE_DEPENDS RxSwift)
elseif(LLVM_LTO)
  add_llvm_lto_executable(SwiftyJSONExample
    SOURCES ${SwiftyJSONExample_sources}
    SWIFT_MODULE_DEPENDS SwiftyJSON)

  add_llvm_lto_executable(SwiftSyntaxExample
    SOURCES ${SwiftSyntaxExample_sources}
    SWIFT_MODULE_DEPENDS SwiftSyntax
    LINKER_OPTIONS
      "-L/Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx/"
      "-L${CMAKE_CURRENT_BINARY_DIR}/third-party"
      "-l_CSwiftSyntax"
      "-l_InternalSwiftSyntaxParser"
      "-rpath" "/Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx")

  add_llvm_lto_executable(RxSwiftExample
    SOURCES ${RxSwiftExample_sources}
    SWIFT_MODULE_DEPENDS RxSwift)
else()
  add_executable(SwiftyJSONExample ${SwiftyJSONExample_sources})
  target_link_libraries(SwiftyJSONExample SwiftyJSON)

  add_executable(SwiftSyntaxExample ${SwiftSyntaxExample_sources})
  target_link_libraries(SwiftSyntaxExample SwiftSyntax _CSwiftSyntax _InternalSwiftSyntaxParser)
  target_link_directories(SwiftSyntaxExample PRIVATE "/Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx/")

  add_executable(RxSwiftExample ${RxSwiftExample_sources})
  target_link_libraries(RxSwiftExample RxSwift)
endif()