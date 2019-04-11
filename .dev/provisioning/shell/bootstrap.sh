#!/usr/bin/env bash

PROJECT_DIR=${1}
GIT_USER_NAME=${2}
GIT_USER_EMAIL=${3}

./git-config.sh ${PROJECT_DIR} ${GIT_USER_NAME} ${GIT_USER_EMAIL}
./git-files.sh ${PROJECT_DIR}
./set-working-dir.sh ${PROJECT_DIR}
