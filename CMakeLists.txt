project(adaside)

cmake_minimum_required(VERSION 3.1)

# Configure use of Qt

find_package(Qt5 REQUIRED COMPONENTS Core)

add_definitions(${Qt5Core_DEFINITIONS})
add_definitions(-fPIC)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "-g")

# Configure AdaSide

FIND_PROGRAM(ADASIDE NAMES "adaside")

if ("${ADASIDE}" STREQUAL "ADASIDE-NOTFOUND")
    message(FATAL_ERROR "AdaSide code generator is required.")
endif()

message(STATUS "Use ${ADASIDE} to generate binding code")

# Configure GNAT project files

#string(REPLACE ";" "\", \"-I" QT_INCLUDE_SWITCHES "${Qt5Core_INCLUDE_DIRS}")
#string(CONCAT QT_INCLUDE_SWITCHES "\"-I" ${QT_INCLUDE_SWITCHES} "\"")

#get_target_property(Qt5Core_IMPORTED_LOCATION Qt5::Core IMPORTED_LOCATION_RELEASE)

#set(CXX_COMPILER_SWITCHES ${QT_INCLUDE_SWITCHES})
configure_file(gnat/qtada_config.gpr.in gnat/qtada_config.gpr @ONLY)

add_subdirectory(sources/QtCore)

