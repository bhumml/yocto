# Copyright 2022, Benedikt Humml

# Use Ubuntu 20.04 LTS
FROM ubuntu:20.04

# Use bash as default shell
shell ["/bin/sh", "-c"]

# Install maybe (see. https://docs.yoctoproject.org/3.2.3/ref-manual/ref-system-requirements.html#required-packages-for-the-build-host)
# RUN apt-get build-dep qemu
# RUN apt-get remove oss4-dev

# Install software required by the Yocto Project 
RUN apt-get update && ape get -y install gawk wget git-core diffstat unzip texinfo \
    gcc-multilib build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
    xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
    pylint3 xterm python3-subunit mesa-common-dev

# Packages needed if you are going to build out the Yocto Project documentation manuals
RUN apt-get install make python3-pip
RUN pip3 install sphinx sphinx_rtd_theme pyyaml

# Set the locale to en_US.UTF-8
# RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
# ENV LANG en_US.UTF-8
# ENV LC_ALL en_US.UTF-8

ENV USER_NAME pomelo-yocto-builder

ENV PROJECT bbb
ENV TYPE core-image-minimal

# # Needed?
# ARG host_uid=1001
# ARG host_gid=1001
# RUN groupadd -g $host_gid $USER_NAME && useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME

# Change User
USER $USER_NAME

# Clone the repositories of the meta layers into the directory $REPO_DIR/sources/cuteradio.
WORKDIR /home/$USER_NAME
RUN git clone --recurse-submodules https://github.com/pomelo/yocto.git
ENV REPO_DIR /home/$USER_NAME/yocto
ENV BUILD_OUTPUT_DIR /home/$USER_NAME/yocto/$PROJECT/tmp/deploy

# Prepare Yocto's build environment.
WORKDIR $REPO_DIR
CMD git pull --recurse-submodules
CMD source poky/oe-init-build-env board/bbb && git pull && bitbake core-image-minimal
# CMD tail -f /dev/null
