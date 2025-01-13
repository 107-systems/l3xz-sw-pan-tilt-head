FROM docker.io/arm64v8/ros:jazzy-ros-base AS install_packages

USER root
WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y \
    git \
    bash \
    vim

RUN apt-get install -y locales
RUN apt-get install -yq tzdata
RUN echo "Europe/Berlin" > /etc/timezone && \
    touch /etc/locale.gen && \
    dpkg-reconfigure -f noninteractive tzdata && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="de_DE.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=de_DE.UTF-8

ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE.UTF-8
ENV LC_ALL de_DE.UTF-8

RUN apt-get update -yq
COPY ./keyboard /etc/default/keyboard
RUN apt-get install keyboard-configuration -yq

#RUN apt-get install -yq ros-dev-tools
RUN apt-get -yq update --fix-missing
RUN apt-get -yq install python3 python3-pip
RUN apt-get -yq install python3-opencv
RUN apt-get -yq install ros-jazzy-rosbridge-server
RUN apt-get -yq install tmux
#RUN pip3 install pyserial
RUN apt-get -yq install python3-serial
RUN apt-get -yq install ros-jazzy-compressed-image-transport

SHELL ["/bin/bash", "-c"]
RUN source /opt/ros/jazzy/setup.bash && \
    cd /usr/src/app && \
    git clone https://github.com/107-systems/l3xz_openmv_camera && \
    cd /usr/src/app/l3xz_openmv_camera && \
    git submodule update --init --progress --depth 1 && \
    colcon build

COPY entrypoint.sh /usr/src/app
COPY head_launch.py /usr/src/app

ENTRYPOINT ["/bin/bash", "/usr/src/app/entrypoint.sh"]
