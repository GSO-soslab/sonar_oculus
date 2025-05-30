# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sonar_oculus: 2 messages, 0 services")

set(MSG_I_FLAGS "-Isonar_oculus:/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sonar_oculus_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg" NAME_WE)
add_custom_target(_sonar_oculus_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sonar_oculus" "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg" NAME_WE)
add_custom_target(_sonar_oculus_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sonar_oculus" "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg" "sonar_oculus/OculusFire:std_msgs/Header:sensor_msgs/Image"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sonar_oculus
)
_generate_msg_cpp(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg"
  "${MSG_I_FLAGS}"
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sonar_oculus
)

### Generating Services

### Generating Module File
_generate_module_cpp(sonar_oculus
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sonar_oculus
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sonar_oculus_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sonar_oculus_generate_messages sonar_oculus_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_cpp _sonar_oculus_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_cpp _sonar_oculus_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sonar_oculus_gencpp)
add_dependencies(sonar_oculus_gencpp sonar_oculus_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sonar_oculus_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sonar_oculus
)
_generate_msg_eus(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg"
  "${MSG_I_FLAGS}"
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sonar_oculus
)

### Generating Services

### Generating Module File
_generate_module_eus(sonar_oculus
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sonar_oculus
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sonar_oculus_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sonar_oculus_generate_messages sonar_oculus_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_eus _sonar_oculus_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_eus _sonar_oculus_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sonar_oculus_geneus)
add_dependencies(sonar_oculus_geneus sonar_oculus_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sonar_oculus_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sonar_oculus
)
_generate_msg_lisp(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg"
  "${MSG_I_FLAGS}"
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sonar_oculus
)

### Generating Services

### Generating Module File
_generate_module_lisp(sonar_oculus
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sonar_oculus
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sonar_oculus_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sonar_oculus_generate_messages sonar_oculus_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_lisp _sonar_oculus_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_lisp _sonar_oculus_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sonar_oculus_genlisp)
add_dependencies(sonar_oculus_genlisp sonar_oculus_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sonar_oculus_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sonar_oculus
)
_generate_msg_nodejs(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg"
  "${MSG_I_FLAGS}"
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sonar_oculus
)

### Generating Services

### Generating Module File
_generate_module_nodejs(sonar_oculus
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sonar_oculus
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sonar_oculus_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sonar_oculus_generate_messages sonar_oculus_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_nodejs _sonar_oculus_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_nodejs _sonar_oculus_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sonar_oculus_gennodejs)
add_dependencies(sonar_oculus_gennodejs sonar_oculus_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sonar_oculus_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sonar_oculus
)
_generate_msg_py(sonar_oculus
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg"
  "${MSG_I_FLAGS}"
  "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sonar_oculus
)

### Generating Services

### Generating Module File
_generate_module_py(sonar_oculus
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sonar_oculus
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sonar_oculus_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sonar_oculus_generate_messages sonar_oculus_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusFire.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_py _sonar_oculus_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lin/develop/ros/soslab_ws/src/sensors/sonar_oculus/msg/OculusPing.msg" NAME_WE)
add_dependencies(sonar_oculus_generate_messages_py _sonar_oculus_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sonar_oculus_genpy)
add_dependencies(sonar_oculus_genpy sonar_oculus_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sonar_oculus_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sonar_oculus)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sonar_oculus
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(sonar_oculus_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sonar_oculus)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sonar_oculus
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(sonar_oculus_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sonar_oculus)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sonar_oculus
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(sonar_oculus_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sonar_oculus)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sonar_oculus
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(sonar_oculus_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sonar_oculus)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sonar_oculus\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sonar_oculus
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(sonar_oculus_generate_messages_py sensor_msgs_generate_messages_py)
endif()
