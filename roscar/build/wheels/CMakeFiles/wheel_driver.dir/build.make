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
CMAKE_SOURCE_DIR = /home/alex/RaspberryPiProject/roscar/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alex/RaspberryPiProject/roscar/build

# Include any dependencies generated for this target.
include wheels/CMakeFiles/wheel_driver.dir/depend.make

# Include the progress variables for this target.
include wheels/CMakeFiles/wheel_driver.dir/progress.make

# Include the compile flags for this target's objects.
include wheels/CMakeFiles/wheel_driver.dir/flags.make

wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o: wheels/CMakeFiles/wheel_driver.dir/flags.make
wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o: /home/alex/RaspberryPiProject/roscar/src/wheels/src/wheeldriver.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/RaspberryPiProject/roscar/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o"
	cd /home/alex/RaspberryPiProject/roscar/build/wheels && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o -c /home/alex/RaspberryPiProject/roscar/src/wheels/src/wheeldriver.cpp

wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.i"
	cd /home/alex/RaspberryPiProject/roscar/build/wheels && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/RaspberryPiProject/roscar/src/wheels/src/wheeldriver.cpp > CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.i

wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.s"
	cd /home/alex/RaspberryPiProject/roscar/build/wheels && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/RaspberryPiProject/roscar/src/wheels/src/wheeldriver.cpp -o CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.s

wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o.requires:
.PHONY : wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o.requires

wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o.provides: wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o.requires
	$(MAKE) -f wheels/CMakeFiles/wheel_driver.dir/build.make wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o.provides.build
.PHONY : wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o.provides

wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o.provides.build: wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o

wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o: wheels/CMakeFiles/wheel_driver.dir/flags.make
wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o: /home/alex/RaspberryPiProject/roscar/src/wheels/src/wheeldrivernode.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alex/RaspberryPiProject/roscar/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o"
	cd /home/alex/RaspberryPiProject/roscar/build/wheels && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o -c /home/alex/RaspberryPiProject/roscar/src/wheels/src/wheeldrivernode.cpp

wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.i"
	cd /home/alex/RaspberryPiProject/roscar/build/wheels && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alex/RaspberryPiProject/roscar/src/wheels/src/wheeldrivernode.cpp > CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.i

wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.s"
	cd /home/alex/RaspberryPiProject/roscar/build/wheels && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alex/RaspberryPiProject/roscar/src/wheels/src/wheeldrivernode.cpp -o CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.s

wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o.requires:
.PHONY : wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o.requires

wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o.provides: wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o.requires
	$(MAKE) -f wheels/CMakeFiles/wheel_driver.dir/build.make wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o.provides.build
.PHONY : wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o.provides

wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o.provides.build: wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o

# Object files for target wheel_driver
wheel_driver_OBJECTS = \
"CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o" \
"CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o"

# External object files for target wheel_driver
wheel_driver_EXTERNAL_OBJECTS =

/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: wheels/CMakeFiles/wheel_driver.dir/build.make
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libcv_bridge.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_videostab.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_video.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_superres.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_stitching.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_photo.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_ocl.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_objdetect.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_ml.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_legacy.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_imgproc.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_highgui.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_gpu.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_flann.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_features2d.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_core.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_contrib.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libopencv_calib3d.so.2.4.8
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libroslib.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libtf.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libtf2_ros.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libactionlib.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libmessage_filters.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libroscpp.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libboost_signals.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libxmlrpcpp.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libtf2.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libroscpp_serialization.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/librosconsole.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/librosconsole_log4cxx.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/librosconsole_backend_interface.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/liblog4cxx.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libboost_regex.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/librostime.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /opt/ros/jade/lib/libcpp_common.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so
/home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver: wheels/CMakeFiles/wheel_driver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver"
	cd /home/alex/RaspberryPiProject/roscar/build/wheels && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wheel_driver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
wheels/CMakeFiles/wheel_driver.dir/build: /home/alex/RaspberryPiProject/roscar/devel/lib/wheels/wheel_driver
.PHONY : wheels/CMakeFiles/wheel_driver.dir/build

wheels/CMakeFiles/wheel_driver.dir/requires: wheels/CMakeFiles/wheel_driver.dir/src/wheeldriver.cpp.o.requires
wheels/CMakeFiles/wheel_driver.dir/requires: wheels/CMakeFiles/wheel_driver.dir/src/wheeldrivernode.cpp.o.requires
.PHONY : wheels/CMakeFiles/wheel_driver.dir/requires

wheels/CMakeFiles/wheel_driver.dir/clean:
	cd /home/alex/RaspberryPiProject/roscar/build/wheels && $(CMAKE_COMMAND) -P CMakeFiles/wheel_driver.dir/cmake_clean.cmake
.PHONY : wheels/CMakeFiles/wheel_driver.dir/clean

wheels/CMakeFiles/wheel_driver.dir/depend:
	cd /home/alex/RaspberryPiProject/roscar/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/RaspberryPiProject/roscar/src /home/alex/RaspberryPiProject/roscar/src/wheels /home/alex/RaspberryPiProject/roscar/build /home/alex/RaspberryPiProject/roscar/build/wheels /home/alex/RaspberryPiProject/roscar/build/wheels/CMakeFiles/wheel_driver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : wheels/CMakeFiles/wheel_driver.dir/depend

