#!/bin/bash

# # Pull Repos
git pull --recurse-submodules
# Source Environment
pwd

cd /home/$USER/yocto
source poky-jethro/oe-init-build-env bbb;
# Bitbake
bitbake core-image-minimal;
