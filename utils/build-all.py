#!/usr/bin/python3

import subprocess
from multiprocessing import Pool
import os
import sys

class Context:
    def __init__(self, build_script, swiftc):
        self.build_script = build_script
        self.swiftc = swiftc

    def work(self, variant):
        cmd = [self.build_script, variant, self.swiftc]
        print("Execute", cmd)
        proc = subprocess.run(cmd)

def main():
    variants = [
        "Onone", "Onone-swift-lto", "Onone-llvm-lto", "Onone-swift-llvm-lto",
        "O"    , "O-swift-lto"    , "O-llvm-lto"    , "O-swift-llvm-lto"    ,
        "Osize", "Osize-swift-lto", "Osize-llvm-lto", "Osize-swift-llvm-lto",
    ]

    swiftc = sys.argv[1]
    utils = os.path.dirname(__file__)
    build_script = os.path.join(utils, "build-script.sh")

    context = Context(build_script, swiftc)

    with Pool(8) as p:
        p.map(context.work, variants)

if __name__ == '__main__':
    main()