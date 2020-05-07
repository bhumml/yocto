#!/bin/bash

# # Pull Repos
git pull --recurse-submodules;
git pull;
# Source Environment
sh 'source poky-jethro/oe-init-build-env bbb';
# Bitbake

if pwd == '/home/autbuilder/yocto/bbb'
then
    echo 'Alles cool'
    bitbake core-image-minimal;
else
    echo 'Alles uncool'