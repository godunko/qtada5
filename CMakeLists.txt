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

FIND_PROGRAM(ADASIDE "adaside")

# Configure GNAT project files

#string(REPLACE ";" "\", \"-I" QT_INCLUDE_SWITCHES "${Qt5Core_INCLUDE_DIRS}")
#string(CONCAT QT_INCLUDE_SWITCHES "\"-I" ${QT_INCLUDE_SWITCHES} "\"")

#get_target_property(Qt5Core_IMPORTED_LOCATION Qt5::Core IMPORTED_LOCATION_RELEASE)

#set(CXX_COMPILER_SWITCHES ${QT_INCLUDE_SWITCHES})
configure_file(gnat/qtada_config.gpr.in gnat/qtada_config.gpr @ONLY)

# Prepare project files search paths switches

list(APPEND GPRBUILD_GRP_FLAGS "-aP${PROJECT_BINARY_DIR}/gnat")
list(APPEND GPRBUILD_GRP_FLAGS "-aP${PROJECT_SOURCE_DIR}/gnat")

# Run GPRbuild to build binding library

add_custom_target(binding ALL COMMAND "gprbuild" ${GPRBUILD_GRP_FLAGS} "-p" "-Pqtada_qtcore.gpr")
#add_dependencies(binding apiextractor)
