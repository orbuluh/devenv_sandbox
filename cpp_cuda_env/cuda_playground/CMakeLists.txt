cmake_minimum_required(VERSION 3.14...3.28)

project(
  CUDA_Playground
  VERSION 0.1
  DESCRIPTION "CUDA playground"
  LANGUAGES CXX)

set(CMAKE_CUDA_HOST_COMPILER "${CMAKE_CXX_COMPILER}")
enable_language(CUDA)

# CUDA requires OpenMP"
find_package(OpenMP REQUIRED)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")

find_package(CUDAToolkit 11.0 REQUIRED)

set(CMAKE_CUDA_FLAGS
    "${CMAKE_CUDA_FLAGS} -Xcompiler=${OpenMP_CXX_FLAGS} -Xcompiler=-fPIC -Xcompiler=-Wall"
)

# reference for mapping of CUDA toolkit component versions to supported
# architectures ("compute capabilities"):
# https://en.wikipedia.org/wiki/CUDA#GPUs_supported
set(CUDA_ARCHS "60" "61" "62" "70" "75")
if(CUDA_VERSION VERSION_GREATER_EQUAL "110")
  list(APPEND CUDA_ARCHS "80")
endif()
if(CUDA_VERSION VERSION_GREATER_EQUAL "111")
  list(APPEND CUDA_ARCHS "86")
endif()
if(CUDA_VERSION VERSION_GREATER_EQUAL "115")
  list(APPEND CUDA_ARCHS "87")
endif()
if(CUDA_VERSION VERSION_GREATER_EQUAL "118")
  list(APPEND CUDA_ARCHS "89")
  list(APPEND CUDA_ARCHS "90")
endif()
list(POP_BACK CUDA_ARCHS CUDA_LAST_SUPPORTED_ARCH)
list(APPEND CUDA_ARCHS "${CUDA_LAST_SUPPORTED_ARCH}+PTX")
if(USE_DEBUG)
  set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -g")
else()
  set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -O3 -lineinfo")
endif()
message(STATUS "CMAKE_CUDA_FLAGS: ${CMAKE_CUDA_FLAGS}")

if(NOT DEFINED CMAKE_CUDA_STANDARD)
  set(CMAKE_CUDA_STANDARD 11)
  set(CMAKE_CUDA_STANDARD_REQUIRED ON)
endif()

add_executable(${PROJECT_NAME} main.cu)

set_target_properties(
  ${PROJECT_NAME} PROPERTIES CUDA_ARCHITECTURES ${CUDA_ARCHS}
                             CUDA_SEPARABLE_COMPILATION ON)

target_link_libraries(${PROJECT_NAME} PRIVATE ${CUDAToolkit_LIBRARIES})
target_include_directories(${PROJECT_NAME} PRIVATE ${CUDAToolkit_INCLUDE_DIRS})
