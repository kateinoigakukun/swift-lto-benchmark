include(SwiftLTOSupport)

add_subdirectory(third-party)

set(xcode_toolchain /Applications/Xcode-11.4.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr)
set(benchmark_linker_options
  "-rpath" "${CMAKE_CURRENT_BINARY_DIR}/../lib"
  "-L${CMAKE_CURRENT_BINARY_DIR}/../lib"
  "-lBenchmark")

set(SwiftyJSONExample_sources SwiftyJSONExample.swift)
set(SwiftyJSONExample_linker_options ${benchmark_linker_options})
set(SwiftyJSONExample_args SwiftyJSONExample
  SOURCES ${SwiftyJSONExample_sources}
  SWIFT_MODULE_DEPENDS SwiftyJSON
  LINKER_OPTIONS ${SwiftyJSONExample_linker_options})

set(SwiftSyntaxExample_sources SwiftSyntaxExample.swift)
set(SwiftSyntaxExample_linker_options
  ${benchmark_linker_options}
  "-L${xcode_toolchain}/lib/swift/macosx/"
  "-L${CMAKE_CURRENT_BINARY_DIR}/third-party"
  "-l_CSwiftSyntax"
  "-l_InternalSwiftSyntaxParser"
  "-rpath" "${xcode_toolchain}/lib/swift/macosx")
set(SwiftSyntaxExample_args SwiftSyntaxExample
  SOURCES ${SwiftSyntaxExample_sources}
  SWIFT_MODULE_DEPENDS SwiftSyntax
  LINKER_OPTIONS ${SwiftSyntaxExample_linker_options})

set(RxSwiftExample_sources RxSwiftExample.swift)
set(RxSwiftExample_linker_options ${benchmark_linker_options})
set(RxSwiftExample_args RxSwiftExample
  SOURCES ${RxSwiftExample_sources}
  SWIFT_MODULE_DEPENDS RxSwift
  LINKER_OPTIONS ${RxSwiftExample_linker_options})


set(SwiftNumericsExample_sources SwiftNumericsExample.swift)
set(SwiftNumericsExample_linker_options
  ${benchmark_linker_options}
  "-rpath" "${SWIFT_BUILD_DIR}/lib/swift/macosx/x86_64")
set(SwiftNumericsExample_args SwiftNumericsExample
  SOURCES ${SwiftNumericsExample_sources}
  SWIFT_MODULE_DEPENDS ComplexModule RealModule
  LINKER_OPTIONS ${SwiftNumericsExample_linker_options})


set(SwiftStdlibExample_sources SwiftStdlibExample.swift)
if("${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin")
set(SwiftStdlibExample_linker_options
  ${benchmark_linker_options}
-L${LLVM_BUILD_DIR}/lib
-L${SWIFT_BUILD_DIR}/lib/swift/macosx/x86_64
-L${SWIFT_BUILD_DIR}/lib/swift/macosx
-L/Applications/Xcode-12-beta3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk/usr/lib/swift
-headerpad_max_install_names
-dead_strip
-sectcreate
__TEXT
__info_plist
${SWIFT_BUILD_DIR}/stdlib/public/core/Info.plist
-compatibility_version 1
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/AnyHashableSupport.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Array.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/BackDeployment.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Casting.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/CompatibilityOverride.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/CygwinPort.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Demangle.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Enum.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/EnvironmentVariables.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorObjectCommon.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorObjectConstants.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorObjectNative.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Errors.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorDefaultImpls.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Exclusivity.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ExistentialContainer.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Float16Support.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/FoundationSupport.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Heap.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/HeapObject.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ImageInspectionCommon.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ImageInspectionMachO.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ImageInspectionELF.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ImageInspectionCOFF.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/KeyPaths.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/KnownMetadata.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Metadata.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/MetadataLookup.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/MutexPThread.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/MutexWin32.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Numeric.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Once.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Portability.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ProtocolConformance.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/RefCount.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/RuntimeInvocationsTracking.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/SwiftDtoa.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorObject.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/SwiftObject.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/SwiftValue.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ReflectionMirror.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ObjCRuntimeGetImageNameFromClass.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/ErrorHandling.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/Hashing.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/MemAlloc.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/SmallPtrSet.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/SmallVector.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/StringRef.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/Context.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/Demangler.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/ManglingUtils.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/NodePrinter.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/OldDemangler.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/OldRemangler.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/Punycode.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/Remangler.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/NodeDumper.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Assert.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/CommandLine.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/GlobalObjects.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/LibcShims.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Random.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Stubs.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/ThreadLocalStorage.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/MathStubs.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Availability.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/FoundationHelpers.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/OptionalBridgingHelper.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Reflection.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/SwiftNativeNSXXXBaseARC.m.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/UnicodeNormalization.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/8/SwiftNativeNSXXXBase.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/core/CMakeFiles/swiftCore-macosx-x86_64.dir/__/__/linker-support/magic-symbols-for-install-name.c.o
-licucore
-lc++
-F/Applications/Xcode-12-beta3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk/../../../Developer/Library/Frameworks)
else()
set(SwiftStdlibExample_linker_options
  ${benchmark_linker_options}
-L${LLVM_BUILD_DIR}/lib
-L${SWIFT_BUILD_DIR}/lib/swift/linux/x86_64
-L/usr/lib/swift
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/AnyHashableSupport.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Array.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/BackDeployment.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Casting.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/CompatibilityOverride.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/CygwinPort.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Demangle.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Enum.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/EnvironmentVariables.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ErrorObjectCommon.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ErrorObjectConstants.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ErrorObjectNative.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Errors.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ErrorDefaultImpls.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Exclusivity.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ExistentialContainer.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Float16Support.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/FoundationSupport.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Heap.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/HeapObject.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ImageInspectionCommon.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ImageInspectionMachO.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ImageInspectionELF.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ImageInspectionCOFF.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/KeyPaths.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/KnownMetadata.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Metadata.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/MetadataLookup.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/MutexPThread.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/MutexWin32.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Numeric.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Once.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/Portability.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ProtocolConformance.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/RefCount.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/RuntimeInvocationsTracking.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/SwiftDtoa.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ErrorObject.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/SwiftObject.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/SwiftValue.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ReflectionMirror.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/runtime/CMakeFiles/swiftRuntime-linux-x86_64.dir/ObjCRuntimeGetImageNameFromClass.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-linux-x86_64.dir/ErrorHandling.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-linux-x86_64.dir/Hashing.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-linux-x86_64.dir/MemAlloc.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-linux-x86_64.dir/SmallPtrSet.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-linux-x86_64.dir/SmallVector.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-linux-x86_64.dir/StringRef.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/Context.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/Demangler.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/ManglingUtils.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/NodePrinter.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/OldDemangler.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/OldRemangler.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/Punycode.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/Remangler.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/CMakeFiles/swiftDemangling-linux-x86_64.dir/__/__/lib/Demangling/NodeDumper.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/Assert.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/CommandLine.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/GlobalObjects.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/LibcShims.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/Random.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/Stubs.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/ThreadLocalStorage.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/MathStubs.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/Availability.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/FoundationHelpers.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/OptionalBridgingHelper.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/Reflection.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/SwiftNativeNSXXXBaseARC.m.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/UnicodeNormalization.cpp.o
${SWIFT_BUILD_DIR}/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-linux-x86_64.dir/8/SwiftNativeNSXXXBase.mm.o
${SWIFT_BUILD_DIR}/stdlib/public/core/CMakeFiles/swiftCore-linux-x86_64.dir/__/__/linker-support/magic-symbols-for-install-name.c.o
${SWIFT_BUILD_DIR}/lib/swift/linux/x86_64/swiftrt.o
-lpthread
-ldl
/usr/lib/x86_64-linux-gnu/libicuuc.so
/usr/lib/x86_64-linux-gnu/libicui18n.so
-lstdc++
-lm
  )
endif()
set(SwiftStdlibExample_args SwiftStdlibExample
    SOURCES ${SwiftStdlibExample_sources}
    SWIFT_MODULE_DEPENDS Swift
    LINKER_OPTIONS ${SwiftStdlibExample_linker_options})

if(SWIFT_LTO AND LLVM_LTO)
  add_swift_llvm_lto_executable(${SwiftyJSONExample_args})
  add_swift_llvm_lto_executable(${SwiftSyntaxExample_args})
  add_swift_llvm_lto_executable(${RxSwiftExample_args})
  add_swift_llvm_lto_executable(${SwiftStdlibExample_args})
  add_swift_llvm_lto_executable(${SwiftNumericsExample_args})
elseif(SWIFT_LTO)
  add_swift_lto_executable(${SwiftyJSONExample_args})
  add_swift_lto_executable(${SwiftSyntaxExample_args})
  add_swift_lto_executable(${RxSwiftExample_args})
  add_swift_lto_executable(${SwiftStdlibExample_args})
  add_swift_lto_executable(${SwiftNumericsExample_args})
elseif(LLVM_LTO)
  add_llvm_lto_executable(${SwiftyJSONExample_args})
  add_llvm_lto_executable(${SwiftSyntaxExample_args})
  add_llvm_lto_executable(${RxSwiftExample_args})
  add_llvm_lto_executable(${SwiftStdlibExample_args})
  add_llvm_lto_executable(${SwiftNumericsExample_args})
else()
  add_swift_executable(${SwiftyJSONExample_args})
  add_swift_executable(${SwiftSyntaxExample_args})
  add_swift_executable(${RxSwiftExample_args})
  add_swift_executable(${SwiftStdlibExample_args})
  add_swift_executable(${SwiftNumericsExample_args})
endif()
