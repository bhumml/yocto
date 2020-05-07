#!/bin/bash

# Pull Repos
git pull --recurse-submodules
# Source Environment
source /home/$USER/yocto/poky-jethro/oe-init-build-env /home/$USER/yocto/bbb/;
# Bitbake
bitbake core-image-minimal;
