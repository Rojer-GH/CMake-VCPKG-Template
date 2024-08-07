# Load in cpplint
find_program(
	${SB_CPPLINT}
	NAMES ${SB_CPPLINT}
	DOC ${SB_CPPLINT_DOC}
	REQUIRED
)

# Load in clang-tidy
#find_program(
#	${SB_CLANG_TIDY}
#	NAMES ${SB_CLANG_TIDY}
#	DOC ${SB_CLANG_TIDY_DOC}
#	REQUIRED
#)

# Add CPPLint target
add_custom_target(
	${SB_CPPLINT}
	COMMAND ${${SB_CPPLINT}} ${SB_CPPLINT_ARGS}
	WORKING_DIRECTORY ${SB_ROOT}
)

# Set clang-tidy settings. Also acts as the command for the custom target
#set(CMAKE_CXX_CLANG_TIDY ${${SB_CLANG_TIDY}} ${SB_CLANG_TIDY_ARGS})

# Add the tidy custom target
#add_custom_target(
#	${SB_CLANG_TIDY}
#	COMMAND ${CMAKE_CXX_CLANG_TIDY}
#	WORKING_DIRECTORY ${SB_ROOT}
#	DEPENDS ${SB_ENGINE_SOURCE}
#)

#if(CMAKE_GENERATOR STREQUAL ${SB_VS})
#	# Import the clang_build.ps1 to the binary directory
#	configure_file(
#		${SB_CLANG_BUILD_INPUT}
#		${SB_CLANG_BUILD_OUTPUT}
#		COPYONLY
#	)
#
#	# Add a pre-build event to the clang-tidy target, thats builds the compilation database
#	add_custom_command(
#		TARGET ${SB_CLANG_TIDY}
#		PRE_BUILD
#		COMMAND ${SB_CLANG_BUILD_COMMAND}
#		WORKING_DIRECTORY ${SB_BIN}
#		VERBATIM
#	)
#endif(CMAKE_GENERATOR STREQUAL ${SB_VS})

# 100% Lint completion
#add_custom_target(
#	${SB_LINT}
#)

# Set Lint as giga-chad target
#add_dependencies(${SB_LINT} ${SB_CLANG_TIDY} ${SB_CPPLINT})

# Add all targets to the same folder

#set_property(
#	TARGET ${SB_LINT}
#	PROPERTY FOLDER ${SB_LINT_FOLDER}
#)

#set_property(
#	TARGET ${SB_CLANG_TIDY}
#	PROPERTY FOLDER ${SB_LINT_FOLDER}
#)

#set_property(
#	TARGET ${SB_CPPLINT}
#	PROPERTY FOLDER ${SB_LINT_FOLDER}
#)
