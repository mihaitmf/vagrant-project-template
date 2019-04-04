#!/usr/bin/env bash

WORK_DIR=/var/DEFAULT-PROJECT

# Set working directory after vagrant ssh
echo "cd $WORK_DIR" >> /home/vagrant/.bashrc
