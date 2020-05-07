#!/bin/bash

# # Pull Repos
git pull --recurse-submodules;
git pull;
# Source Environment
sh 'source poky-jethro/oe-init-build-env bbb';
# Bitbake
bitbake core-image-minimal;

if pwd == '/home/autbuilder/yocto/bbb'
then
    echo 'Alles cool'
else
    echo 'Alles uncool'