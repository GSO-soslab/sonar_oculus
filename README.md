# sonar_oculus
ROS device driver for Blueprint Subsea's Oculus multibeam sonars. This package is from [The Robust Field Autonomy Lab at Stevens Institute of Technology](https://github.com/RobustFieldAutonomyLab/bluerov/tree/master/sonar_oculus)

## Tested in Jetson Xavier NX(Ubuntu18.04, Opencv 4) and Oculus 750d

## Build in Jetson(ubuntu 18.04)

### Dependency

- scipy: `$sudo apt-get install python-scipy`
- cv_bridge: using opencv4 and python3
    - download:
    ```sh
    # python3
    $ sudo apt-get install python3-pip python-catkin-tools python3-dev python3-numpy
    $ sudo pip3 install rospkg catkin_pkg
    # downalod cv_bridge
    $ cd ~/path_to_new_workspace/
    $ git clone -b noetic https://github.com/ros-perception/vision_opencv.git
    ```
    - modify *CMakeLists.txt*:

         change `find_package(Boost REQUIRED python37)` 
         to `find_package(Boost REQUIRED python3)`
    - build:
    ```sh
    $ cd ~/path_to_new_workspace/
    $ catkin config -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython3.6m.so
    $ catkin build cv_bridge
    ```
    - setup: 

        add `SET(cv_bridge_DIR ~/path_to_new_workspace/devel/share/cv_bridge/cmake)` before `find_package` in the *sonar_oculus/CMakeLists.txt*
- build: `catkin build sonar_oculus`

# Usage

```
roslaunch sonar_oculus sonar_oculus.launch

# play bag file
roslaunch sonar_oculus sonar_oculus.launch sonar:=false
```