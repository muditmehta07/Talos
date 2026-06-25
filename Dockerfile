FROM osrf/ros:humble-desktop

# 1. Install dependencies (using standard official global mirrors)
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    ros-humble-gazebo-ros-pkgs \
    sudo \
    mesa-utils \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

# 2. Setup the local user environment mapping to your host UID
ARG USERNAME=talos
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# 3. Initialize rosdep as root
RUN rosdep init

# 4. Switch to the non-root user and set up workspace environment
RUN echo "source /opt/ros/humble/setup.bash" >> /home/$USERNAME/.bashrc

USER $USERNAME
WORKDIR /home/$USERNAME/ros2_ws

# 5. Run rosdep update as the local user
RUN rosdep update

CMD ["/bin/bash"]
