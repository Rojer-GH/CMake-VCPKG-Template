#[[
	Base CMake file
	The following is done in our CMake build:
	1. Setup CMake settings
	2. Setup VCPKG settings
	3. Setup Project settings
	4. Setup Tools and Analyzers
	5. Setup Engine libraries
	6. Setup Tests
]]

# Our needed CMake version
cmake_minimum_required(
	VERSION 3.24.0
	FATAL_ERROR
)

#[[
	Macro that wraps a call to include(), to check if the file exists. Additional values can be passed, which will be printed as error messages

	@param file: The file to include
]]
macro(include_throw_error FILE)
	include(
		${FILE}
		RESULT_VARIABLE ${FILE}_file
	)

	if(${FILE} STREQUAL NOTFOUND)
		message(FATAL_ERROR "${FILE} not found! ${ARGN}")
	endif()
endmacro(include_throw_error)

# All our CMake scripts are in this path, grouped into usage domains
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/scripts/cmake)

# Never use Magic values! Always use variables!
include_throw_error(common/constants "This is a CMake-Dev error")

# Setup CMake
#include_throw_error(${SB_COMMON_SETUP} ${SB_CMAKE_DEV_ERROR})

# Setup VCPKG
#include_throw_error(${SB_COMMON_VCPKG} ${SB_CMAKE_DEV_ERROR})

# Setup project
#project(
#	${SB_PROJECT_NAME}
#	VERSION ${SB_PROJECT_VERSION}
#	DESCRIPTION ${SB_PROJET_DESCRIPTION}
#)

#include_throw_error(${SB_PROJECT_SETUP} ${SB_CMAKE_DEV_ERROR})

# Tools and Analyzers
#
#include_throw_error(${SB_TOOLS_DOCUMENTATION} ${SB_CMAKE_DEV_ERROR})

#include_throw_error(${SB_TOOLS_LINT} ${SB_CMAKE_DEV_ERROR})

# Engine Libs

#add_subdirectory(${SB_ENGINE_ROOT})
#
# Test Libs

#add_subdirectory(${SB_TEST_ROOT})
