# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.6

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/am/Desktop/embrel/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/am/Desktop/embrel/build

# Utility rule file for api-docs.

CMakeFiles/api-docs: CMakeFiles/api-docs.dir/build.make
	/usr/bin/doxygen doc/Doxyfile

api-docs: CMakeFiles/api-docs
api-docs: CMakeFiles/api-docs.dir/build.make
.PHONY : api-docs

# Rule to build all files generated by this target.
CMakeFiles/api-docs.dir/build: api-docs
.PHONY : CMakeFiles/api-docs.dir/build

CMakeFiles/api-docs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/api-docs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/api-docs.dir/clean

CMakeFiles/api-docs.dir/depend:
	cd /home/am/Desktop/embrel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/am/Desktop/embrel/src /home/am/Desktop/embrel/src /home/am/Desktop/embrel/build /home/am/Desktop/embrel/build /home/am/Desktop/embrel/build/CMakeFiles/api-docs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/api-docs.dir/depend
