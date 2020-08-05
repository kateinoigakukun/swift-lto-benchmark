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
  "-rpath" "/Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/swift-macosx-x86_64/./lib/swift/macosx/x86_64")
set(SwiftNumericsExample_args SwiftNumericsExample
  SOURCES ${SwiftNumericsExample_sources}
  SWIFT_MODULE_DEPENDS ComplexModule RealModule
  LINKER_OPTIONS ${SwiftNumericsExample_linker_options})


set(SwiftStdlibExample_sources SwiftStdlibExample.swift)
set(SwiftStdlibExample_linker_options
  ${benchmark_linker_options}
-L/Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/llvm-macosx-x86_64/./lib
-L/Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/swift-macosx-x86_64/./lib/swift/macosx/x86_64
-L/Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/swift-macosx-x86_64/./bin/../lib/swift/macosx/x86_64
-L/Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/swift-macosx-x86_64/./bin/../lib/swift/macosx
-L/Applications/Xcode-12-beta3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk/usr/lib/swift
-headerpad_max_install_names
-dead_strip
-sectcreate
__TEXT
__info_plist
/Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/core/Info.plist
-application_extension
-compatibility_version 1
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/AnyHashableSupport.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Array.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/BackDeployment.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Casting.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/CompatibilityOverride.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/CygwinPort.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Demangle.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Enum.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/EnvironmentVariables.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorObjectCommon.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorObjectConstants.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorObjectNative.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Errors.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorDefaultImpls.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Exclusivity.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ExistentialContainer.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Float16Support.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/FoundationSupport.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Heap.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/HeapObject.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ImageInspectionCommon.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ImageInspectionMachO.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ImageInspectionELF.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ImageInspectionCOFF.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/KeyPaths.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/KnownMetadata.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Metadata.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/MetadataLookup.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/MutexPThread.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/MutexWin32.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Numeric.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Once.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/Portability.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ProtocolConformance.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/RefCount.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/RuntimeInvocationsTracking.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/SwiftDtoa.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ErrorObject.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/SwiftObject.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/SwiftValue.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ReflectionMirror.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/runtime/CMakeFiles/swiftRuntime-macosx-x86_64.dir/ObjCRuntimeGetImageNameFromClass.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/ErrorHandling.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/Hashing.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/MemAlloc.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/SmallPtrSet.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/SmallVector.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/LLVMSupport/CMakeFiles/swiftLLVMSupport-macosx-x86_64.dir/StringRef.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/Context.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/Demangler.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/ManglingUtils.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/NodePrinter.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/OldDemangler.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/OldRemangler.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/Punycode.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/Remangler.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/CMakeFiles/swiftDemangling-macosx-x86_64.dir/__/__/lib/Demangling/NodeDumper.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Assert.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/CommandLine.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/GlobalObjects.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/LibcShims.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Random.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Stubs.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/ThreadLocalStorage.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/MathStubs.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Availability.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/FoundationHelpers.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/OptionalBridgingHelper.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/Reflection.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/SwiftNativeNSXXXBaseARC.m.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/UnicodeNormalization.cpp.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/stubs/CMakeFiles/swiftStdlibStubs-macosx-x86_64.dir/8/SwiftNativeNSXXXBase.mm.o
/Users/kateinoigakukun/projects/swift-source/build/Ninja-ReleaseAssert/swift-macosx-x86_64/stdlib/public/core/CMakeFiles/swiftCore-macosx-x86_64.dir/__/__/linker-support/magic-symbols-for-install-name.c.o
-licucore
-lc++
-lSystem
/Users/kateinoigakukun/projects/swift-source-2/build/Ninja-ReleaseAssert/llvm-macosx-x86_64/lib/clang/10.0.0/lib/darwin/libclang_rt.osx.a
-F/Applications/Xcode-12-beta3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk/../../../Developer/Library/Frameworks)
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