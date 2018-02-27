cmake_minimum_required(VERSION 3.4.3)

find_package(LLVM REQUIRED CONFIG)


message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

add_definitions(${LLVM_DEFINITIONS})

SET(CMAKE_CXX_FLAGS "-std=c++11 -fno-rtti")

include_directories(${LLVM_INCLUDE_DIRS})

add_subdirectory(SignatureDetection)