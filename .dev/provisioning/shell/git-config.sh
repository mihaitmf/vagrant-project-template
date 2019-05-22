#!/usr/bin/env bash

PROJECT_DIR=${1}
GIT_USER_NAME=${2}
GIT_USER_EMAIL=${3}

# Install git if not exists
if ! type git >/dev/null 2>&1; then
    apt update >/dev/null
    apt install -y git >/dev/null

    # Check installation succeeded
    if ! type git >/dev/null 2>&1; then
        echo "ERROR installing git"
        exit 1
    fi
fi

# Config git user
(cd ${PROJECT_DIR}; git config user.name "${GIT_USER_NAME}" && git config user.email ${GIT_USER_EMAIL})

exit 0
