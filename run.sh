#!/bin/bash

# Allow local container connections to your Fedora GUI display
xhost +local:docker

docker run -it \
  --name ros2_container \
  --rm \
  --privileged \
  --network host \
  --ipc host \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /home/mudit/Projects/Talos:/home/talos/ros2_ws \
  ros2-humble-image

# Revoke permission when the container closes (for security)
xhost -local:docker
