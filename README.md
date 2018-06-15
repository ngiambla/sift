# SIFT
Signature Based Fault Tolerance



## Background

There is a need for verification and/or correctness for hardware in the presence of radiation, and abnormal operating conditions.
Within high-level synthesis, methdologies which permit fault tolerance are not well presented. This project aims to induce some 
notion of fault tolerance through control flow.


## Usage

To use the pass with an existing LLVM installation, navigate to the subdirectory `source/` in this project and run:

```bash
$ cmake .
$ make
``` 

And voila, the pass should be instantiated.

To view the effects of the pass:

```bash
$ clang -c -emit-llvm file.c -o file.bc
$ opt -debug -load ../source/SignatureDetection/libLLVMSignatureDetection.so -signatureDetection file.bc -o opted_file.bc
```

You can test this by navigating to the `test_files/` directory and running:

```bash
$ ./clean_up.sh
$ ./run_test.sh
```

## Author
Nicholas Giamblanco (M.A.Sc.)

@ The University of Toronto



