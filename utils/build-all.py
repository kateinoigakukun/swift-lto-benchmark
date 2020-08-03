#!/usr/bin/python3

import subprocess
from subprocess import PIPE
import os
import sys

variants = [
    "Onone", "Onone-swift-lto", "Onone-llvm-lto", "Onone-swift-llvm-lto",
    "O"    , "O-swift-lto"    , "O-llvm-lto"    , "O-swift-llvm-lto"    ,
    "Osize", "Osize-swift-lto", "Osize-llvm-lto", "Osize-swift-llvm-lto",
]

swiftc = sys.argv[1]
utils = os.path.dirname(__file__)
build_script = os.path.join(utils, "build-script.sh")

procs = []

for variant in variants:
    cmd = "{} {} {}".format(build_script, variant, swiftc)
    print("Execute", cmd)
    proc = subprocess.Popen(cmd, shell=True, stdout=PIPE, stderr=PIPE, text=True)
    procs.append(proc)

for proc in procs:
    print("Waiting ", proc.args)
    proc.communicate()
