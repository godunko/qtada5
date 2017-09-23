
FOREACH(d ${Qt5Core_INCLUDE_DIRS})
    LIST(APPEND QT_ADASIDE_INCLUDE_SWITCHES "-I${d}")
ENDFOREACH(d)

# Generate binding code

add_custom_target(gen_qtcore ALL COMMAND "${ADASIDE}"
                  "global.h"
                  "${CMAKE_SOURCE_DIR}/sources/QtCore/typesystem_core.xml"
                  --output-directory=${CMAKE_BUILD_DIR}/sources/QtCore
                  -I${CMAKE_SOURCE_DIR}/sources/QtCore
                  ${QT_ADASIDE_INCLUDE_SWITCHES})

# Prepare project files search paths switches

list(APPEND GPRBUILD_GRP_FLAGS "-aP${PROJECT_BINARY_DIR}/gnat")
list(APPEND GPRBUILD_GRP_FLAGS "-aP${PROJECT_SOURCE_DIR}/gnat")

# Run GPRbuild to build binding library

add_custom_target(qtadacore ALL COMMAND "gprbuild" ${GPRBUILD_GRP_FLAGS} "-p" "-Pqtada_qtcore.gpr")
add_dependencies(qtadacore gen_qtcore)
