#!/bin/bash

echo "Conducting tests.";
clang -c -emit-llvm test_me.c -o test_me.bc
clang -S -c -emit-llvm test_me.c -o test_me.ll
opt  -load ../source/SignatureDetection/libLLVMSignatureDetection.so -signatureDetection test_me.bc -o test_me_2.bc

clang -S -emit-llvm test_me_2.bc -o test_me_2.ll
