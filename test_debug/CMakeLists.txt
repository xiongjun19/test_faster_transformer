cmake_minimum_required(VERSION 3.10)
project(demo)

set(CMAKE_CXX_STANDARD 11)
find_package(PythonLibs 3.8.8 REQUIRED)
message(STATUS "Python Include = ${PYTHON_INCLUDE_DIRS}")
include_directories(${PYTHON_INCLUDE_DIRS})

add_library(${PROJECT_NAME} SHARED library.cpp)
set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")
