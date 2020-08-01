#!/bin/bash

set -x
SWIFTC=$1
ROOT_PATH="$(cd "$(dirname $0)/../" && pwd)"

mkdir -p "$ROOT_PATH/build"

function cmake_options() {
    local variant=$1
    case "${variant}" in
        "Onone")     echo "-DLTO=FALSE -DCMAKE_BUILD_TYPE=" ;;
        "Onone-LTO") echo "-DLTO=TRUE -DCMAKE_BUILD_TYPE=" ;;
        "O")         echo "-DLTO=FALSE -DCMAKE_BUILD_TYPE=Release" ;;
        "O-LTO")     echo "-DLTO=TRUE -DCMAKE_BUILD_TYPE=Release";;
    esac
}

MATRIX=("Onone" "Onone-LTO" "O" "O-LTO")

for variant in "${MATRIX[@]}"; do
    mkdir -p "${ROOT_PATH}/build/${variant}"
    (cd "${ROOT_PATH}/build/${variant}" && \
        cmake ../../ -GNinja $(cmake_options $variant) \
            -DCMAKE_Swift_COMPILER=$SWIFTC && \
        ninja benchmark)
done