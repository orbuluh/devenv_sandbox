# Get the short Git hash
execute_process(
  COMMAND git rev-list --count HEAD
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    OUTPUT_VARIABLE VERSION_FROM_GIT_OFFSET_CNT
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# Configure the version header file
configure_file(
  "${PROJECT_SOURCE_DIR}/include/Version.h.in"
  "${PROJECT_BINARY_DIR}/include/Version.h"
)