SET(CMAKE_CXX_FLAGS "-std=c++11 -fno-rtti")
add_library(LLVMSignatureDetection MODULE SignatureDetection.cpp)