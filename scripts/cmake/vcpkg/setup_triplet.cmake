# Custom triplet file, adapt this file to use different triplets provided by the packages.

set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)

# Match against packages names, and change certain attributes for them.
#if(PORT MATCHES "imgui|physx")
#    set(VCPKG_LIBRARY_LINKAGE dynamic)
#endif()
