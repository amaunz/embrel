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

# Include any dependencies generated for this target.
include configuration/CMakeFiles/erlconfig.dir/depend.make

# Include the progress variables for this target.
include configuration/CMakeFiles/erlconfig.dir/progress.make

# Include the compile flags for this target's objects.
include configuration/CMakeFiles/erlconfig.dir/flags.make

configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o: configuration/CMakeFiles/erlconfig.dir/flags.make
configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o: /home/am/Desktop/embrel/src/configuration/configuration.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/am/Desktop/embrel/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o"
	cd /home/am/Desktop/embrel/build/configuration && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/erlconfig.dir/configuration.cpp.o -c /home/am/Desktop/embrel/src/configuration/configuration.cpp

configuration/CMakeFiles/erlconfig.dir/configuration.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/erlconfig.dir/configuration.cpp.i"
	cd /home/am/Desktop/embrel/build/configuration && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/am/Desktop/embrel/src/configuration/configuration.cpp > CMakeFiles/erlconfig.dir/configuration.cpp.i

configuration/CMakeFiles/erlconfig.dir/configuration.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/erlconfig.dir/configuration.cpp.s"
	cd /home/am/Desktop/embrel/build/configuration && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/am/Desktop/embrel/src/configuration/configuration.cpp -o CMakeFiles/erlconfig.dir/configuration.cpp.s

configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.requires:
.PHONY : configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.requires

configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.provides: configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.requires
	$(MAKE) -f configuration/CMakeFiles/erlconfig.dir/build.make configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.provides.build
.PHONY : configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.provides

configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.provides.build: configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o
.PHONY : configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.provides.build

# Object files for target erlconfig
erlconfig_OBJECTS = \
"CMakeFiles/erlconfig.dir/configuration.cpp.o"

# External object files for target erlconfig
erlconfig_EXTERNAL_OBJECTS =

configuration/liberlconfig.so: configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o
configuration/liberlconfig.so: /usr/lib/libboost_program_options-mt.so
configuration/liberlconfig.so: /usr/lib/libboost_filesystem-mt.so
configuration/liberlconfig.so: /usr/lib/libboost_system-mt.so
configuration/liberlconfig.so: /usr/lib/libboost_regex-mt.so
configuration/liberlconfig.so: /usr/lib/libboost_serialization-mt.so
configuration/liberlconfig.so: configuration/CMakeFiles/erlconfig.dir/build.make
configuration/liberlconfig.so: configuration/CMakeFiles/erlconfig.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library liberlconfig.so"
	cd /home/am/Desktop/embrel/build/configuration && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/erlconfig.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
configuration/CMakeFiles/erlconfig.dir/build: configuration/liberlconfig.so
.PHONY : configuration/CMakeFiles/erlconfig.dir/build

configuration/CMakeFiles/erlconfig.dir/requires: configuration/CMakeFiles/erlconfig.dir/configuration.cpp.o.requires
.PHONY : configuration/CMakeFiles/erlconfig.dir/requires

configuration/CMakeFiles/erlconfig.dir/clean:
	cd /home/am/Desktop/embrel/build/configuration && $(CMAKE_COMMAND) -P CMakeFiles/erlconfig.dir/cmake_clean.cmake
.PHONY : configuration/CMakeFiles/erlconfig.dir/clean

configuration/CMakeFiles/erlconfig.dir/depend:
	cd /home/am/Desktop/embrel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/am/Desktop/embrel/src /home/am/Desktop/embrel/src/configuration /home/am/Desktop/embrel/build /home/am/Desktop/embrel/build/configuration /home/am/Desktop/embrel/build/configuration/CMakeFiles/erlconfig.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : configuration/CMakeFiles/erlconfig.dir/depend

