#!/usr/bin/env bash

PROJECT_DIR=/var/DEFAULT-PROJECT

# Set working directory after vagrant ssh
echo "cd $PROJECT_DIR" >> /home/vagrant/.bashrc
