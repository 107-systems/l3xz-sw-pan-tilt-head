#!/bin/bash

source /opt/ros/humble/setup.bash
cd /usr/src/app/
source l3xz_openmv_camera/install/setup.bash
ros2 launch head_launch.py
