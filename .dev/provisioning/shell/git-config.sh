#!/usr/bin/env bash

PROJECT_DIR=${1}
GIT_USER_NAME=${2}
GIT_USER_EMAIL=${3}

apt update >/dev/null
apt install -y git >/dev/null

# Config git user
(cd ${PROJECT_DIR}; git config user.name "${GIT_USER_NAME}" && git config user.email ${GIT_USER_EMAIL})
