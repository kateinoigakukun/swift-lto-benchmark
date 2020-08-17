#!/bin/bash

usage() {
    echo "Usage: $(basename $0) variant path/to/swiftc [-n]"
    echo "Options:"
    echo -e "  -n\tskip build"
    exit 1
}

if [ $# -lt 2 ]; then
    usage
fi

set -e
SWIFTC=$2
CLANG="$(dirname $SWIFTC)/clang"
VARIANT=$1
ROOT_PATH="$(cd "$(dirname $0)/../" && pwd)"

shift
shift
for opt in "$@"
do
    case $opt in
        -n) SKIP_BUILD=1;;
        *) usage;;
    esac
    shift
done

mkdir -p "$ROOT_PATH/build"

is_swift_lto() {
    local variant=$1
    case "${variant}" in
        *-swift-lto | *-swift-llvm-lto)
            echo "TRUE" ;;
        *)  echo "FALSE" ;;
    esac
}

is_llvm_lto() {
    local variant=$1
    case "${variant}" in
        *-llvm-lto | *-swift-llvm-lto)
            echo "TRUE" ;;
        *)  echo "FALSE" ;;
    esac
}

cmake_build_type() {
    local variant=$1
    case "${variant}" in
        Onone-* | Onone) echo "" ;;
        O-* | O)         echo "Release" ;;
        Osize-* | Osize) echo "MinSizeRel" ;;
    esac
}

cmake_options() {
    echo "-DSWIFT_LTO=$(is_swift_lto $1) -DLLVM_LTO=$(is_llvm_lto $1) -DCMAKE_BUILD_TYPE=$(cmake_build_type $1)"
}

mkdir -p "${ROOT_PATH}/build/${VARIANT}"
pushd "${ROOT_PATH}/build/${VARIANT}"
cmake ../../ -GNinja $(cmake_options $VARIANT) \
     -DCMAKE_Swift_COMPILER=$SWIFTC \
     -DCMAKE_C_COMPILER=$CLANG
if [[ ! "${SKIP_BUILD}" ]]; then
    ninja Benchmark
    ninja examples
fi
popd
