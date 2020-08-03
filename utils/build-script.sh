#!/bin/bash

usage() {
    echo "Usage: $(basename $0) path/to/swiftc [-n]"
    echo "Options:"
    echo -e "  -n\tskip build"
    exit 1
}

if [ $# -le 0 ]; then
    usage
fi

set -e
SWIFTC=$1
ROOT_PATH="$(cd "$(dirname $0)/../" && pwd)"

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
        *-swift-lto) echo "TRUE" ;;
        *)           echo "FALSE" ;;
    esac
}

is_llvm_lto() {
    local variant=$1
    case "${variant}" in
        *-llvm-lto) echo "TRUE" ;;
        *)          echo "FALSE" ;;
    esac
}

cmake_build_type() {
    local variant=$1
    case "${variant}" in
        Onone-*) echo "" ;;
        O-*)     echo "Release" ;;
        Osize-*) echo "MinSizeRel" ;;
    esac
}

cmake_options() {
    echo "-DSWIFT_LTO=$(is_swift_lto $1) -DLLVM_LTO=$(is_llvm_lto $1) -DCMAKE_BUILD_TYPE=$(cmake_build_type $1)"
}

MATRIX=(
    "Onone" "Onone-swift-lto" "Onone-llvm-lto"
    "O"     "O-swift-lto"     "O-llvm-lto"
    "Osize" "Osize-swift-lto" "Osize-llvm-lto"
)

for variant in "${MATRIX[@]}"; do
    mkdir -p "${ROOT_PATH}/build/${variant}"
    pushd "${ROOT_PATH}/build/${variant}"
    cmake ../../ -GNinja $(cmake_options $variant) \
         -DCMAKE_Swift_COMPILER=$SWIFTC
    if [[ ! "${SKIP_BUILD}" ]]; then
        ninja benchmark
    fi
    popd
done
