#!/bin/bash

echo "Conducting tests.";
clang -c -emit-llvm test_me.c -o test_me.bc
opt -load ../source/SignatureDetection/libLLVMSignatureDetection.so -signatureDetection test_me.bc > test_me_2.bc

