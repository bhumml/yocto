#!/bin/bash

source /home/$USER/yocto/poky-jethro/oe-init-build-env /home/$USER/yocto/bbb;
bitbake core-image-weston;