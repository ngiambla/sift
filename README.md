# SIFT
Signature Based Fault Tolerance



## Background
There is a need for verification and/or correctness for high level descriptions of algorithms.
Hence, an automated method which can verify the correctness of some particular functionality would be super handy.


## Usage

To load the pass into an existing LLVM structure, navigate to the subdirectory `source/` in this project and run:

```bash
$ cmake .
$ make
``` 

And voila, the pass should be instantiated.

To view the effects of the pass:

```bash
$ clang -c -emit-llvm file.c -o file.bc
$ opt -debug -load ../source/SignatureDetection/libLLVMSignatureDetection.so -signatureDetection test_me.bc
```


## Author
Nicholas Giamblanco (M.A.Sc.), Ishita Ray (M.Eng)



