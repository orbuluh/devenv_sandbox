cmake_minimum_required(VERSION 3.14...3.28)

project(
  MPI_Playground
  VERSION 0.1
  DESCRIPTION "MPI playground"
  LANGUAGES CXX)

find_package(MPI REQUIRED)
add_definitions(-DUSE_MPI)
include_directories(${MPI_CXX_INCLUDE_PATH})

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} PUBLIC ${MPI_CXX_LIBRARIES})
