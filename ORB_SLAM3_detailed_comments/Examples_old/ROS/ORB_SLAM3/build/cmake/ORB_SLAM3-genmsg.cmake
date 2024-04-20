# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ORB_SLAM3: 1 messages, 0 services")

set(MSG_I_FLAGS "-IORB_SLAM3:/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ORB_SLAM3_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg" NAME_WE)
add_custom_target(_ORB_SLAM3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ORB_SLAM3" "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg" "sensor_msgs/PointField:sensor_msgs/PointCloud2:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ORB_SLAM3
  "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ORB_SLAM3
)

### Generating Services

### Generating Module File
_generate_module_cpp(ORB_SLAM3
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ORB_SLAM3
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ORB_SLAM3_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ORB_SLAM3_generate_messages ORB_SLAM3_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg" NAME_WE)
add_dependencies(ORB_SLAM3_generate_messages_cpp _ORB_SLAM3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ORB_SLAM3_gencpp)
add_dependencies(ORB_SLAM3_gencpp ORB_SLAM3_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ORB_SLAM3_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ORB_SLAM3
  "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ORB_SLAM3
)

### Generating Services

### Generating Module File
_generate_module_eus(ORB_SLAM3
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ORB_SLAM3
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ORB_SLAM3_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ORB_SLAM3_generate_messages ORB_SLAM3_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg" NAME_WE)
add_dependencies(ORB_SLAM3_generate_messages_eus _ORB_SLAM3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ORB_SLAM3_geneus)
add_dependencies(ORB_SLAM3_geneus ORB_SLAM3_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ORB_SLAM3_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ORB_SLAM3
  "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ORB_SLAM3
)

### Generating Services

### Generating Module File
_generate_module_lisp(ORB_SLAM3
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ORB_SLAM3
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ORB_SLAM3_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ORB_SLAM3_generate_messages ORB_SLAM3_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg" NAME_WE)
add_dependencies(ORB_SLAM3_generate_messages_lisp _ORB_SLAM3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ORB_SLAM3_genlisp)
add_dependencies(ORB_SLAM3_genlisp ORB_SLAM3_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ORB_SLAM3_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ORB_SLAM3
  "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ORB_SLAM3
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ORB_SLAM3
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ORB_SLAM3
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ORB_SLAM3_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ORB_SLAM3_generate_messages ORB_SLAM3_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg" NAME_WE)
add_dependencies(ORB_SLAM3_generate_messages_nodejs _ORB_SLAM3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ORB_SLAM3_gennodejs)
add_dependencies(ORB_SLAM3_gennodejs ORB_SLAM3_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ORB_SLAM3_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ORB_SLAM3
  "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ORB_SLAM3
)

### Generating Services

### Generating Module File
_generate_module_py(ORB_SLAM3
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ORB_SLAM3
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ORB_SLAM3_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ORB_SLAM3_generate_messages ORB_SLAM3_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/ORB_SLAM3_detailed_comments/Examples_old/ROS/ORB_SLAM3/msg/pclpos.msg" NAME_WE)
add_dependencies(ORB_SLAM3_generate_messages_py _ORB_SLAM3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ORB_SLAM3_genpy)
add_dependencies(ORB_SLAM3_genpy ORB_SLAM3_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ORB_SLAM3_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ORB_SLAM3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ORB_SLAM3
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ORB_SLAM3_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(ORB_SLAM3_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ORB_SLAM3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ORB_SLAM3
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ORB_SLAM3_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(ORB_SLAM3_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ORB_SLAM3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ORB_SLAM3
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ORB_SLAM3_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(ORB_SLAM3_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ORB_SLAM3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ORB_SLAM3
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ORB_SLAM3_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(ORB_SLAM3_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ORB_SLAM3)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3.8\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ORB_SLAM3\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ORB_SLAM3
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ORB_SLAM3_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(ORB_SLAM3_generate_messages_py sensor_msgs_generate_messages_py)
endif()
