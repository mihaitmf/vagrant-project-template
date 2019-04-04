#!/usr/bin/env bash

PROJECT_DIR=/var/DEFAULT-PROJECT

# Add project root directory variable to the environment file
echo "export PROJECT_DIR=$PROJECT_DIR" >> ${PROJECT_DIR}/config.env
source ${PROJECT_DIR}/config.env

# Set working directory after vagrant ssh
echo "cd $PROJECT_DIR" >> /home/vagrant/.bashrc
