#!/bin/bash

echo "Conducting tests.";

chstoneDir="chstone"

echo "~ Changing Directory: $chstoneDir/"
cd ../$chstoneDir/

for d in */; do

    cd $d

    for i in `find -type f`; do 
        if [[ "$i" = *".c" && $(basename $d) = $(basename $i .c) ]]; then
            name=$(basename $i .c)
            if [[ $(basename $i .c) = "sha" ]]; then
                name=sha_driver
            fi
            if [[ $(basename $i .c) = "motion" ]]; then
                name=mpeg2
            fi
            clang -c -emit-llvm $name.c -o $name.bc
            llvm-dis $name.bc
            opt -reg2mem $name.bc -o $name.nophi.bc
            llvm-dis $name.nophi.bc
            opt  -load ../../source/SignatureDetection/libLLVMSignatureDetection.so -signatureDetection $name.nophi.bc -o $name.sig.bc
            llvm-dis $name.sig.bc
        fi
    done
    cd ../
done
