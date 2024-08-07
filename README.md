# CMake-VCPKG-Template
A CMake project, where the external dependencies are bound in via VCPKG. The goal is to support Windows, Mac OS, and Linux, and also different toolsets, like Ninja, VS, Codeblocks, Makefiles... and so on.

# Usage

There are only 3 requirements that need to be fulfilled by the user before using this setup:

1. A C++ compiler
2. An implementation of the C++ Standard Library
3. Git, obviously. However, no so obviously, one also needs "Git Bash" for Windows, as all scripts are written in Shell Script.