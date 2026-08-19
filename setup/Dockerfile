FROM osrf/ros:jazzy-desktop-full

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenGL drivers and Gazebo integration packages
RUN apt-get update && apt-get install -y \
    mesa-utils \
    libgl1-mesa-dri \
    libgl1 \
    libglx-mesa0 \
    ros-jazzy-ros-gz \
    python3-colcon-common-extensions \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

# Automatically source ROS 2 Jazzy on container start
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc

WORKDIR /ros2_ws

CMD ["bash"]
