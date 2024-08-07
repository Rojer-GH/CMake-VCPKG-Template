# We do not allow in-source builds...

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
	message(FATAL_ERROR ${SB_SAME_DIR_ERROR})
endif(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})

# Include global scripts

include_throw_error(${SB_COMMON_CPP_STANDARDS} ${SB_CMAKE_DEV_ERROR})

# Configurations:
#   - DEBUG: Debug information, highest level of warnings
#   - RELEASE: Subtle optimizations, moderate level of warnings
#   - SHIP: Highest level of optimizations, no warnings
set(
	CMAKE_CONFIGURATION_TYPES ${SB_CONFIGURATIONS}
	CACHE STRING INTERNAL FORCE
)
