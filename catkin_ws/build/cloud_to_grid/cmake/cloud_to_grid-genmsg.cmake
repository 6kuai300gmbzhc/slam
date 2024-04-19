# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cloud_to_grid: 1 messages, 0 services")

set(MSG_I_FLAGS "-Icloud_to_grid:/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cloud_to_grid_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg" NAME_WE)
add_custom_target(_cloud_to_grid_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cloud_to_grid" "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg" "std_msgs/Header:sensor_msgs/PointField:sensor_msgs/PointCloud2"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cloud_to_grid
  "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cloud_to_grid
)

### Generating Services

### Generating Module File
_generate_module_cpp(cloud_to_grid
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cloud_to_grid
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cloud_to_grid_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cloud_to_grid_generate_messages cloud_to_grid_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg" NAME_WE)
add_dependencies(cloud_to_grid_generate_messages_cpp _cloud_to_grid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cloud_to_grid_gencpp)
add_dependencies(cloud_to_grid_gencpp cloud_to_grid_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cloud_to_grid_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(cloud_to_grid
  "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cloud_to_grid
)

### Generating Services

### Generating Module File
_generate_module_eus(cloud_to_grid
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cloud_to_grid
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cloud_to_grid_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cloud_to_grid_generate_messages cloud_to_grid_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg" NAME_WE)
add_dependencies(cloud_to_grid_generate_messages_eus _cloud_to_grid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cloud_to_grid_geneus)
add_dependencies(cloud_to_grid_geneus cloud_to_grid_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cloud_to_grid_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cloud_to_grid
  "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cloud_to_grid
)

### Generating Services

### Generating Module File
_generate_module_lisp(cloud_to_grid
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cloud_to_grid
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cloud_to_grid_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cloud_to_grid_generate_messages cloud_to_grid_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg" NAME_WE)
add_dependencies(cloud_to_grid_generate_messages_lisp _cloud_to_grid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cloud_to_grid_genlisp)
add_dependencies(cloud_to_grid_genlisp cloud_to_grid_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cloud_to_grid_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(cloud_to_grid
  "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cloud_to_grid
)

### Generating Services

### Generating Module File
_generate_module_nodejs(cloud_to_grid
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cloud_to_grid
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(cloud_to_grid_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(cloud_to_grid_generate_messages cloud_to_grid_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg" NAME_WE)
add_dependencies(cloud_to_grid_generate_messages_nodejs _cloud_to_grid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cloud_to_grid_gennodejs)
add_dependencies(cloud_to_grid_gennodejs cloud_to_grid_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cloud_to_grid_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cloud_to_grid
  "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cloud_to_grid
)

### Generating Services

### Generating Module File
_generate_module_py(cloud_to_grid
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cloud_to_grid
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cloud_to_grid_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cloud_to_grid_generate_messages cloud_to_grid_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fish/bishe/catkin_ws/src/cloud_to_grid/msg/pclpos.msg" NAME_WE)
add_dependencies(cloud_to_grid_generate_messages_py _cloud_to_grid_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cloud_to_grid_genpy)
add_dependencies(cloud_to_grid_genpy cloud_to_grid_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cloud_to_grid_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cloud_to_grid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cloud_to_grid
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(cloud_to_grid_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(cloud_to_grid_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cloud_to_grid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cloud_to_grid
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(cloud_to_grid_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(cloud_to_grid_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cloud_to_grid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cloud_to_grid
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(cloud_to_grid_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(cloud_to_grid_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cloud_to_grid)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cloud_to_grid
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(cloud_to_grid_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(cloud_to_grid_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cloud_to_grid)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cloud_to_grid\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cloud_to_grid
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(cloud_to_grid_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(cloud_to_grid_generate_messages_py sensor_msgs_generate_messages_py)
endif()
