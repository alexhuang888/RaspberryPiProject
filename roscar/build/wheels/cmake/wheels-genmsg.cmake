# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wheels: 9 messages, 6 services")

set(MSG_I_FLAGS "-Iwheels:/home/alex/RaspberryPiProject/roscar/src/wheels/msg;-Iwheels:/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/jade/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wheels_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:wheels/set_car_direction_speedResult:std_msgs/Header"
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg" "wheels/set_car_direction_speedActionResult:wheels/set_car_direction_speedActionFeedback:actionlib_msgs/GoalStatus:wheels/set_car_direction_speedActionGoal:actionlib_msgs/GoalID:std_msgs/Header:wheels/set_car_direction_speedGoal:wheels/set_car_direction_speedFeedback:wheels/set_car_direction_speedResult"
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg" "wheels/set_car_direction_speedGoal:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg" "wheels/set_car_direction_speedFeedback:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv" ""
)

get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg" NAME_WE)
add_custom_target(_wheels_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheels" "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_msg_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)

### Generating Services
_generate_srv_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_srv_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_srv_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_srv_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_srv_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)
_generate_srv_cpp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
)

### Generating Module File
_generate_module_cpp(wheels
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wheels_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wheels_generate_messages wheels_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg" NAME_WE)
add_dependencies(wheels_generate_messages_cpp _wheels_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheels_gencpp)
add_dependencies(wheels_gencpp wheels_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheels_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_msg_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)

### Generating Services
_generate_srv_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_srv_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_srv_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_srv_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_srv_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)
_generate_srv_eus(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
)

### Generating Module File
_generate_module_eus(wheels
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(wheels_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(wheels_generate_messages wheels_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg" NAME_WE)
add_dependencies(wheels_generate_messages_eus _wheels_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheels_geneus)
add_dependencies(wheels_geneus wheels_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheels_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_msg_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)

### Generating Services
_generate_srv_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_srv_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_srv_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_srv_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_srv_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)
_generate_srv_lisp(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
)

### Generating Module File
_generate_module_lisp(wheels
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wheels_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wheels_generate_messages wheels_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg" NAME_WE)
add_dependencies(wheels_generate_messages_lisp _wheels_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheels_genlisp)
add_dependencies(wheels_genlisp wheels_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheels_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg;/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/jade/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_msg_py(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)

### Generating Services
_generate_srv_py(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_srv_py(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_srv_py(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_srv_py(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_srv_py(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)
_generate_srv_py(wheels
  "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
)

### Generating Module File
_generate_module_py(wheels
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wheels_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wheels_generate_messages wheels_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_direction_speed.srv" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedFeedback.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_send_manual_instruction.srv" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionResult.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_navigator_engine_status.srv" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedResult.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedAction.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionGoal.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_get_one_wheel_status.srv" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedGoal.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/wheels_status.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/devel/share/wheels/msg/set_car_direction_speedActionFeedback.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_car_two_wheels_direction_speed.srv" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/srv/cmd_set_navigator_engine.srv" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/RaspberryPiProject/roscar/src/wheels/msg/navigator_engine_status.msg" NAME_WE)
add_dependencies(wheels_generate_messages_py _wheels_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheels_genpy)
add_dependencies(wheels_genpy wheels_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheels_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheels
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(wheels_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(wheels_generate_messages_cpp actionlib_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheels
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(wheels_generate_messages_eus std_msgs_generate_messages_eus)
add_dependencies(wheels_generate_messages_eus actionlib_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheels
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(wheels_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(wheels_generate_messages_lisp actionlib_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheels
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(wheels_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(wheels_generate_messages_py actionlib_msgs_generate_messages_py)
