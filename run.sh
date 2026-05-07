docker run -it \
  --name ros2_container \
  --privileged \
  --network host \
  --ipc host \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v ~/Talos:/home/talos/ros2_ws \
  ros2-humble-image
