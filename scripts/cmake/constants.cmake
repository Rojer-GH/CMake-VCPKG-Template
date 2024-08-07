#[[
	This file contains all the strings, numbers, lists, and whatsoever we need to setup our project.

	Our set-directives are ordered as folllows:
	1. Common
	2. Directories
	2. Include directories
	3. CMake
	4. VCPKG
]]

set(PREFIX SB)

if(${PREFIX} STREQUAL "PREFIX")
	message(FATAL_ERROR "The Prefix Variable should be set to something...")
endif()

macro(DEFINE_CONSTANT N V)
	set(${PREFIX}_${N} ${V})
endmacro()

#macro(GET N)
#	set(${PREFIX}_${N} ${V})
#endmacro()

########## Common ##########

#set(VS "Visual Studio 17 2022")

########## Base Directories ##########

# The root directory of the project
DEFINE_CONSTANT(BASE ${CMAKE_SOURCE_DIR})

# The output directory
DEFINE_CONSTANT(OUT ${CMAKE_BINARY_DIR})

########## Cmake Scripts ##########

#set(SB_COMMON_CPP_STANDARDS 	common/cpp_standards)
#set(SB_COMMON_SETUP 			common/setup)
#set(SB_COMMON_VCPKG 			common/vcpkg)
#set(SB_COMMON_VCPKG_SCRIPT		vendor/vcpkg/scripts/buildsystems/vcpkg.cmake)

#set(SB_PROJECT_SETUP 			project/setup)

#set(SB_PROJECT_ENGINE_SETUP 	project/engine/setup)

#set(SB_PROJECT_TEST_SETUP		project/test/setup)

#set(SB_TOOLS_DOCUMENTATION		tools/documentation)
#set(SB_TOOLS_LINT 				tools/lint)

########## CMake ##########

#set(SB_CONFIGURATIONS DEBUG RELEASE SHIP)
#set(SB_CONFIGURATION_DEBUG SB_DEBUG)
#set(SB_CONFIGURATION_RELEASE SB_DEBUG)
#set(SB_CONFIGURATION_SHIP SB_DEBUG)

# Error messages

#set(SB_CMAKE_DEV_ERROR "This is a CMake-Dev error")
#set(SB_CMAKE_SAME_DIR_ERROR "It seems as if you are using CMake directly. Please use the dev environment!")

########## Project ##########

# Constants

#set(SB_PROJECT_NAME "Project-E")
#set(SB_PROJECT_VERSION 0.1.0.0)
#set(SB_PROJET_DESCRIPTION "Project to build the engine")

# Settings

#set(SB_PROJECT_FOLDER_DOCS "Docs")

########## VCPKG ##########

#set(SB_VS_TRIPLET x64-windows-static)
#set(SB_VCPKG_INSTALLED_DIR ${CMAKE_SOURCE_DIR}/vendor/libs)

########## Engine ##########

# Defines

#set(SB_EXPORT SB_EXPORT)

# Directory
#set(SB_ENGINE_ROOT ${SB_ROOT}/engine)

# Folder
#set(SB_ENGINE Engine)

# Source files
#file(GLOB_RECURSE SB_ENGINE_SOURCE CONFIGURE_DEPENDS ${SB_ENGINE_ROOT}/*.cpp ${SB_ENGINE_ROOT}/*.h)

########## Test ##########

# Directory
#set(SB_TEST_ROOT ${SB_ROOT}/test)

#set(SB_TEST Test)

########## Documentation ##########

#set(SB_DOCS ${SB_ROOT}/docs)

# Error messages

#set(SB_DOXYGEN_SPHINX_ERROR "Doxygen and Sphinx needs to be installed to generate the documentation")

########## Doxygen ##########

#set(SB_DOXYGEN doxygen)
#set(SB_DOXYGEN_BUILD doxygen_build)
#set(SB_DOXYGEN_CLEAN doxygen_clean)
#set(SB_DOXYGEN_CONFIG ${SB_DOCS}/doxygen.conf)
#set(SB_DOXYGEN_OUTPUT ${SB_DOCS}/doxygen)
#set(SB_DOXYGEN_ARGS ${SB_DOXYGEN_CONFIG})
#set(SB_DOXYGEN_DOC "Documentation generation tool (http://www.doxygen.org)")
#set(SB_DOXYGEN_XML_OUTPUT ${SB_DOXYGEN_OUTPUT}/xml/index.xml)

########## Sphinx ##########

#set(SB_SPHINX sphinx-build)
#set(SB_SPHINX_API ${SB_DOCS}/api)
#set(SB_SPHINX_BUILD sphinx_build)
#set(SB_SPHINX_CLEAN sphinx_clean)
#set(SB_SPHINX_DOC "Documentation generation tool (https://www.sphinx-doc.org/en/master/)")
#set(SB_SPHINX_INPUT ${SB_DOCS})
#set(SB_SPHINX_OUTPUT ${SB_DOCS}/build)
#set(SB_SPHINX_ARGS -b html ${SB_SPHINX_INPUT} ${SB_SPHINX_OUTPUT})

########## Lint ##########

# Folder
#set(SB_LINT_FOLDER Lint)

#set(SB_LINT complete_lint)

########## clang-build ##########

#set(SB_CLANG_BUILD_INPUT ${SB_ROOT}/scripts/windows/clang_build.ps1)
#set(SB_CLANG_BUILD_OUTPUT ${SB_BIN}/clang_build.ps1)
#set(SB_CLANG_BUILD_DOC "Generates Compilation Database (https://github.com/Caphyon/clang-power-tools/blob/master/ClangPowerTools/ClangPowerToolsShared/Tooling/v1/clang-build.ps1)")

#set(SB_CLANG_BUILD_COMMAND powershell -File ${SB_CLANG_BUILD_OUTPUT} -export-jsondb)

########## Clang-Tidy ##########

#set(SB_CLANG_TIDY clang-tidy)
#set(SB_CLANG_TIDY_ARGS -p ${SB_BIN} -checks=-*,bugprone-*,cert-*,clang-analyzer-*,concurrency-*,cppcoreguidelines-*,hicpp-*,misc-*,google-*,modernize-*,mpi-*,performance-*,portability-*,readability-* --format-style=google ${SB_ENGINE_SOURCE})
#set(SB_CLANG_TIDY_BUILD clang_tidy)
#set(SB_CLANG_TIDY_DOC "C++ Linter (https://clang.llvm.org/extra/clang-tidy/)")

########## CPPLint ##########

#set(SB_CPPLINT cpplint)
#set(SB_CPPLINT_ARGS --verbose=0 --recursive --extension=cpp,h --counting=detailed ${SB_ENGINE_ROOT} || (exit 0))
#set(SB_CPPLINT_BUILD cpp_lint)
#set(SB_CPPLINT_DOC "C++ Linter (https://github.com/cpplint/cpplint)")

########## Dependencies ##########

#set(SB_DOCTEST doctest)
#set(SB_SPDLOG spdlog)

#unset(PREFIX)