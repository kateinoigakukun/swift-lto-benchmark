set(CMAKE_SWIFT_LINKER gold.ld)

set(CMAKE_SWIFT_LINKER_FLAGS
    -pie -z relro
    --hash-style=gnu
    --build-id
    --eh-frame-hdr
    -m elf_x86_64
    -dynamic-linker
    /lib64/ld-linux-x86-64.so.2
    /usr/lib/x86_64-linux-gnu/Scrt1.o
    /usr/lib/x86_64-linux-gnu/crti.o
    /usr/lib/gcc/x86_64-linux-gnu/9/crtbeginS.o
    -L${SWIFT_BUILD_DIR}/lib/swift/linux
    -L/usr/lib/gcc/x86_64-linux-gnu/9
    -L/usr/lib/x86_64-linux-gnu
    -L/usr/lib64
    -L/lib/x86_64-linux-gnu
    -L/lib64
    -L/usr/lib
    -L/usr/lib/llvm-9/lib
    -L/lib
    -rpath ${SWIFT_BUILD_DIR}/lib/swift/linux
    ${SWIFT_BUILD_DIR}/lib/swift/linux/x86_64/swiftrt.o
    -lswiftSwiftOnoneSupport
    -lswiftCore
    -lc
    -lgcc
    --as-needed
    -lgcc_s
    --no-as-needed
    /usr/lib/gcc/x86_64-linux-gnu/9/crtendS.o
    /usr/lib/x86_64-linux-gnu/crtn.o
)

set(CMAKE_SHARED_SWIFT_FLAGS -disable-objc-interop)
set(CMAKE_SWIFT_TARGET x86_64-unknown-linux-gnu)