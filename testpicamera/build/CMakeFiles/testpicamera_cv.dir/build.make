# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
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

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alex/RaspberryPiProject/testpicamera

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alex/RaspberryPiProject/testpicamera/build

# Include any dependencies generated for this target.
include CMakeFiles/testpicamera_cv.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/testpicamera_cv.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/testpicamera_cv.dir/flags.make

CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o: CMakeFiles/testpicamera_cv.dir/flags.make
CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o: ../testpicamera_cv.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/RaspberryPiProject/testpicamera/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o -c /home/alex/RaspberryPiProject/testpicamera/testpicamera_cv.cpp

CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/RaspberryPiProject/testpicamera/testpicamera_cv.cpp > CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.i

CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/RaspberryPiProject/testpicamera/testpicamera_cv.cpp -o CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.s

CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o.requires:
.PHONY : CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o.requires

CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o.provides: CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o.requires
	$(MAKE) -f CMakeFiles/testpicamera_cv.dir/build.make CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o.provides.build
.PHONY : CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o.provides

CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o.provides.build: CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o

# Object files for target testpicamera_cv
testpicamera_cv_OBJECTS = \
"CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o"

# External object files for target testpicamera_cv
testpicamera_cv_EXTERNAL_OBJECTS =

testpicamera_cv: CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o
testpicamera_cv: CMakeFiles/testpicamera_cv.dir/build.make
testpicamera_cv: /usr/lib/libmmal_core.so
testpicamera_cv: /usr/lib/libmmal_util.so
testpicamera_cv: /usr/lib/libmmal.so
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_videostab.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_video.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_ts.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_superres.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_stitching.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_photo.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_ocl.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_objdetect.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_ml.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_legacy.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_imgproc.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_highgui.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_gpu.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_flann.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_features2d.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_core.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_contrib.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_calib3d.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_photo.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_legacy.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_video.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_objdetect.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_ml.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_calib3d.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_features2d.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_highgui.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_imgproc.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_flann.so.2.4.8
testpicamera_cv: /usr/lib/arm-linux-gnueabihf/libopencv_core.so.2.4.8
testpicamera_cv: CMakeFiles/testpicamera_cv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable testpicamera_cv"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testpicamera_cv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/testpicamera_cv.dir/build: testpicamera_cv
.PHONY : CMakeFiles/testpicamera_cv.dir/build

CMakeFiles/testpicamera_cv.dir/requires: CMakeFiles/testpicamera_cv.dir/testpicamera_cv.cpp.o.requires
.PHONY : CMakeFiles/testpicamera_cv.dir/requires

CMakeFiles/testpicamera_cv.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/testpicamera_cv.dir/cmake_clean.cmake
.PHONY : CMakeFiles/testpicamera_cv.dir/clean

CMakeFiles/testpicamera_cv.dir/depend:
	cd /home/alex/RaspberryPiProject/testpicamera/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/RaspberryPiProject/testpicamera /home/alex/RaspberryPiProject/testpicamera /home/alex/RaspberryPiProject/testpicamera/build /home/alex/RaspberryPiProject/testpicamera/build /home/alex/RaspberryPiProject/testpicamera/build/CMakeFiles/testpicamera_cv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/testpicamera_cv.dir/depend
