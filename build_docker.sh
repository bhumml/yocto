#!/bin/bash

# # Pull Repos
git pull --recurse-submodules
# Source Environment
source poky-jethro/oe-init-build-env bbb;
# Bitbake
bitbake core-image-minimal;
