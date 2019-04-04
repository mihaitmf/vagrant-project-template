#!/usr/bin/env bash

WORK_DIR=/var/DEFAULT-PROJECT

apt update
apt install -y git

# Config git user
(cd ${WORK_DIR}; git config user.name "mihaitmf" && git config user.email mihai.tmf@gmail.com)
