docker run -it `
  --name ros2_container `
  --network host `
  --ipc host `
  -e DISPLAY=$DISPLAY `
  -v /tmp/.X11-unix:/tmp/.X11-unix `
  -v C:\Users\lol:/home/ros_user/ros2_ws `
  ros2-humble-image
