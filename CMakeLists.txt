cmake_minimum_required(VERSION 2.8.3)
project(sonar_oculus)

add_compile_options(-std=c++11)

SET(OpenCV_DIR /home/lin/develop/3rd/opencv/install/opencv-4.2.0/lib/cmake/opencv4/)
find_package(OpenCV)
message(STATUS "OpenCV library status:")
message(STATUS "    config: ${OpenCV_DIR}")
message(STATUS "    version: ${OpenCV_VERSION}")
message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

SET(cv_bridge_DIR /home/lin/develop/ros/ros_ws/devel/share/cv_bridge/)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  sensor_msgs
  message_generation
  dynamic_reconfigure
  image_transport
  cv_bridge
)

add_message_files(
   FILES
   OculusFire.msg
   OculusPing.msg
)

generate_messages(
   DEPENDENCIES
   sensor_msgs
)

generate_dynamic_reconfigure_options(
   cfg/OculusParams.cfg
 )

catkin_package(
  CATKIN_DEPENDS roscpp sensor_msgs message_runtime image_transport cv_bridge
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(${PROJECT_NAME}_node src/sonar.cpp src/OculusClient.cpp)

add_dependencies(${PROJECT_NAME}_node ${PROJECT_NAME}_gencfg)

add_dependencies(${PROJECT_NAME}_node ${PROJECT_NAME}_generate_messages_cpp)

target_link_libraries(${PROJECT_NAME}_node
   ${catkin_LIBRARIES}
   ${roslib_LIBRARIES}
)

add_executable(${PROJECT_NAME}_transport_node src/image_transport.cpp)
target_link_libraries(${PROJECT_NAME}_transport_node
   ${catkin_LIBRARIES}
   ${roslib_LIBRARIES}
)
