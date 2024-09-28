cmake_minimum_required(VERSION 3.14...3.28)
project(cmake_playground)

include(cmake/parent_scope.cmake)
include(cmake/named_args.cmake)

include(cmake/create_version.cmake)
add_executable(${PROJECT_NAME} main.cpp)
target_include_directories(
  ${PROJECT_NAME} PUBLIC ${CMAKE_BINARY_DIR}/include)