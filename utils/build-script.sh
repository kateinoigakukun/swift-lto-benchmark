#!/bin/bash

usage() {
    echo "Usage: $(basename $0) path/to/swiftc [-n]"
    echo "Options:"
    echo -e "  -n\tskip build"
    exit 1
}

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

cmake_options() {
    local variant=$1
    case "${variant}" in
        "Onone")     echo "-DLTO=FALSE -DCMAKE_BUILD_TYPE=" ;;
        "Onone-LTO") echo "-DLTO=TRUE  -DCMAKE_BUILD_TYPE=" ;;
        "O")         echo "-DLTO=FALSE -DCMAKE_BUILD_TYPE=Release" ;;
        "O-LTO")     echo "-DLTO=TRUE  -DCMAKE_BUILD_TYPE=Release" ;;
        "Osize")     echo "-DLTO=FALSE -DCMAKE_BUILD_TYPE=MinSizeRel" ;;
        "Osize-LTO") echo "-DLTO=TRUE  -DCMAKE_BUILD_TYPE=MinSizeRel" ;;
    esac
}

MATRIX=("Onone" "Onone-LTO" "O" "O-LTO" "Osize" "Osize-LTO")

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
