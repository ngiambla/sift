SET(CMAKE_CXX_FLAGS "-std=c++11 -fno-rtti")

add_library(LLVMSignatureDetection MODULE SignatureDetection.cpp)
target_link_libraries(LLVMSignatureDetection libLLVMInterpreter.a)
target_link_libraries(LLVMSignatureDetection libLLVMExecutionEngine.a)
target_link_libraries(LLVMSignatureDetection -L/home/giambla2/llvm/build/lib)