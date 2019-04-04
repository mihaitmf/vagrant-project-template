#!/usr/bin/env bash

PROJECT_DIR=/var/DEFAULT-PROJECT

GIT_USER_NAME="Mihai Tmf"
GIT_USER_EMAIL=mihai.tmf@gmail.com

apt update
apt install -y git

# Config git user
(cd ${PROJECT_DIR}; git config user.name "${GIT_USER_NAME}" && git config user.email ${GIT_USER_EMAIL})

# Add .gitattributes and .gitignore files to staging area
(cd ${PROJECT_DIR}; git add .gitignore .gitattributes)
