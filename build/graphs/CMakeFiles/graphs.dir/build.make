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
include graphs/CMakeFiles/graphs.dir/depend.make

# Include the progress variables for this target.
include graphs/CMakeFiles/graphs.dir/progress.make

# Include the compile flags for this target's objects.
include graphs/CMakeFiles/graphs.dir/flags.make

graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o: graphs/CMakeFiles/graphs.dir/flags.make
graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o: /home/am/Desktop/embrel/src/graphs/graph_cfg.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/am/Desktop/embrel/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/graphs.dir/graph_cfg.cpp.o -c /home/am/Desktop/embrel/src/graphs/graph_cfg.cpp

graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/graphs.dir/graph_cfg.cpp.i"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/am/Desktop/embrel/src/graphs/graph_cfg.cpp > CMakeFiles/graphs.dir/graph_cfg.cpp.i

graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/graphs.dir/graph_cfg.cpp.s"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/am/Desktop/embrel/src/graphs/graph_cfg.cpp -o CMakeFiles/graphs.dir/graph_cfg.cpp.s

graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.requires:
.PHONY : graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.requires

graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.provides: graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.requires
	$(MAKE) -f graphs/CMakeFiles/graphs.dir/build.make graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.provides.build
.PHONY : graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.provides

graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.provides.build: graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o
.PHONY : graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.provides.build

graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o: graphs/CMakeFiles/graphs.dir/flags.make
graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o: /home/am/Desktop/embrel/src/graphs/sdf/sdf_graph.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/am/Desktop/embrel/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o -c /home/am/Desktop/embrel/src/graphs/sdf/sdf_graph.cpp

graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.i"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/am/Desktop/embrel/src/graphs/sdf/sdf_graph.cpp > CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.i

graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.s"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/am/Desktop/embrel/src/graphs/sdf/sdf_graph.cpp -o CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.s

graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.requires:
.PHONY : graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.requires

graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.provides: graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.requires
	$(MAKE) -f graphs/CMakeFiles/graphs.dir/build.make graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.provides.build
.PHONY : graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.provides

graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.provides.build: graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o
.PHONY : graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.provides.build

graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o: graphs/CMakeFiles/graphs.dir/flags.make
graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o: /home/am/Desktop/embrel/src/graphs/sdf/sdf_reader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/am/Desktop/embrel/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o -c /home/am/Desktop/embrel/src/graphs/sdf/sdf_reader.cpp

graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.i"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/am/Desktop/embrel/src/graphs/sdf/sdf_reader.cpp > CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.i

graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.s"
	cd /home/am/Desktop/embrel/build/graphs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/am/Desktop/embrel/src/graphs/sdf/sdf_reader.cpp -o CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.s

graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.requires:
.PHONY : graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.requires

graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.provides: graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.requires
	$(MAKE) -f graphs/CMakeFiles/graphs.dir/build.make graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.provides.build
.PHONY : graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.provides

graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.provides.build: graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o
.PHONY : graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.provides.build

# Object files for target graphs
graphs_OBJECTS = \
"CMakeFiles/graphs.dir/graph_cfg.cpp.o" \
"CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o" \
"CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o"

# External object files for target graphs
graphs_EXTERNAL_OBJECTS =

graphs/libgraphs.so: graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o
graphs/libgraphs.so: graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o
graphs/libgraphs.so: graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o
graphs/libgraphs.so: graphs/CMakeFiles/graphs.dir/build.make
graphs/libgraphs.so: graphs/CMakeFiles/graphs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libgraphs.so"
	cd /home/am/Desktop/embrel/build/graphs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/graphs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
graphs/CMakeFiles/graphs.dir/build: graphs/libgraphs.so
.PHONY : graphs/CMakeFiles/graphs.dir/build

graphs/CMakeFiles/graphs.dir/requires: graphs/CMakeFiles/graphs.dir/graph_cfg.cpp.o.requires
graphs/CMakeFiles/graphs.dir/requires: graphs/CMakeFiles/graphs.dir/sdf/sdf_graph.cpp.o.requires
graphs/CMakeFiles/graphs.dir/requires: graphs/CMakeFiles/graphs.dir/sdf/sdf_reader.cpp.o.requires
.PHONY : graphs/CMakeFiles/graphs.dir/requires

graphs/CMakeFiles/graphs.dir/clean:
	cd /home/am/Desktop/embrel/build/graphs && $(CMAKE_COMMAND) -P CMakeFiles/graphs.dir/cmake_clean.cmake
.PHONY : graphs/CMakeFiles/graphs.dir/clean

graphs/CMakeFiles/graphs.dir/depend:
	cd /home/am/Desktop/embrel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/am/Desktop/embrel/src /home/am/Desktop/embrel/src/graphs /home/am/Desktop/embrel/build /home/am/Desktop/embrel/build/graphs /home/am/Desktop/embrel/build/graphs/CMakeFiles/graphs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : graphs/CMakeFiles/graphs.dir/depend
