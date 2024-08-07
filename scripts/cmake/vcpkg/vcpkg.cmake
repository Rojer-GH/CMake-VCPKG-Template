# Set target triplet

if(CMAKE_GENERATOR STREQUAL ${SB_VS})
	set(VCPKG_TARGET_TRIPLET ${SB_VS_TRIPLET})
endif(CMAKE_GENERATOR STREQUAL ${SB_VS})

# Set install directory

set(VCPKG_INSTALLED_DIR ${SB_VCPKG_INSTALLED_DIR})

# Include VCPKG

include_throw_error(${SB_COMMON_VCPKG_SCRIPT} "(Maybe run \"workspace build\"?)")
