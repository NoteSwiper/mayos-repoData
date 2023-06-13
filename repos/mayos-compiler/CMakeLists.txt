cmake_minimum_required(VERSION 3.16.1)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.14")

project(mayscript)

file(GLOB_RECURSE SOURCES "source/*.cpp")
file(GLOB_RECURSE HEADERS "source/*.hpp")
file(GLOB_RECURSE MAYSCRIPT "source/*.aes")

add_executable(mayscript ${SOURCES} ${HEADERS} ${MAYSCRIPT})

source_group("MayScript Files" FILES ${MAYSCRIPT})

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT mayscript)

set_target_properties(mayscript PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED OFF
    CXX_EXTENSIONS ON
)

if(NOT EXISTS ${PROJECT_BINARY_DIR}/.gitignore)
    file(WRITE ${PROJECT_BINARY_DIR}/.gitignore)
endif()

