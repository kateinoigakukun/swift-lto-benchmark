set(SWIFT_TOOLCHAIN ${SWIFT_BUILD_DIR})
set(XCODE_TOOLCHAIN /Applications/Xcode-12-beta3.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr)
set(TARGET_SDK /Applications/Xcode-12-beta3.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk)


set(CMAKE_SWIFT_LINKER /usr/bin/ld)
set(CMAKE_SWIFT_LINKER_FLAGS
    -lto_library ${XCODE_TOOLCHAIN}/lib/libLTO.dylib
    ${XCODE_TOOLCHAIN}/lib/swift/clang/lib/darwin/libclang_rt.osx.a
    -syslibroot ${TARGET_SDK}
    -lobjc -lSystem
    -force_load ${SWIFT_TOOLCHAIN}/lib/swift/macosx/libswiftCompatibility51.a
    -force_load ${SWIFT_TOOLCHAIN}/lib/swift/macosx/libswiftCompatibility50.a
    -L ${SWIFT_TOOLCHAIN}/lib/swift/macosx
    -L ${XCODE_TOOLCHAIN}/lib/swift
    -L ${XCODE_TOOLCHAIN}/lib/swift-5.0/macosx/
    -rpath ${SWIFT_TOOLCHAIN}/lib/swift/macosx
    -no_objc_category_merging
    -platform_version macos 10.9.0 10.9.0
    -arch x86_64
)

set(CMAKE_Swift_COMPILER_TARGET x86_64-apple-macosx10.9)