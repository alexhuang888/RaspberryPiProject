#####################################
cmake_minimum_required (VERSION 2.8) 
project (testpicamera)
find_package(raspicam REQUIRED)
find_package(OpenCV REQUIRED)
add_executable (testpicamera testpicamera.cpp)  
target_link_libraries (testpicamera ${raspicam_LIBS})

IF  ( OpenCV_FOUND AND raspicam_CV_FOUND)
	MESSAGE(STATUS "COMPILING OPENCV TESTS")
	add_executable (testpicamera_cv testpicamera_cv.cpp)  
	target_link_libraries (testpicamera_cv ${raspicam_CV_LIBS})
ELSE()
	MESSAGE(FATAL_ERROR "OPENCV NOT FOUND IN YOUR SYSTEM")
ENDIF()

#####################################
