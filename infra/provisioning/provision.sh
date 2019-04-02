#!/usr/bin/env bash

WORK_DIR=/var/DEFAULT-PROJECT

# set working directory after vagrant ssh
echo "cd $WORK_DIR" >> /home/vagrant/.bashrc

# install packages
apt update
#apt install -y nodejs
