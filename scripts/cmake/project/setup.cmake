# General settings for Visual Studio
if(CMAKE_GENERATOR STREQUAL ${SB_VS})
	# Folders for organization
	set_property(GLOBAL PROPERTY USE_FOLDERS ON)
	# Start up project
	set_property(DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${SB_TEST})
	# Add install target
	set(CMAKE_VS_INCLUDE_INSTALL_TO_DEFAULT_BUILD 1)

	set(CMAKE_SUPPRESS_REGENERATION TRUE)
endif(CMAKE_GENERATOR STREQUAL ${SB_VS})

# Set standard and enable testing

cxx_17()
enable_testing()

# Load packages

find_package(${SB_DOCTEST} REQUIRED)
find_package(${SB_SPDLOG} REQUIRED)
