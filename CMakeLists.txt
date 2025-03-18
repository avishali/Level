cmake_minimum_required(VERSION 3.22)

project(RmsLevel)

set(CMAKE_CXX_STANDARD 23)

set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs)
include(cmake/cpm.cmake)

# This commands downloads AND configures JUCE. It sets up some variables, like JUCE_SOURCE_DIR.
CPMAddPackage(
    NAME JUCE
    GIT_TAG 8.0.6
    VERSION 8.0.6
    GITHUB_REPOSITORY juce-framework/JUCE
    SOURCE_DIR ${LIB_DIR}/juce
)

# Adds googletest.
CPMAddPackage(
    NAME GOOGLETEST
    GITHUB_REPOSITORY google/googletest
    GIT_TAG v1.15.2
    VERSION 1.15.2
    SOURCE_DIR ${LIB_DIR}/googletest
    OPTIONS
        "INSTALL_GTEST OFF"
        "gtest_force_shared_crt ON"
)

enable_testing()

add_subdirectory(plugin)
add_subdirectory(test)
