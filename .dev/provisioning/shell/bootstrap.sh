#!/usr/bin/env bash

PROJECT_DIR=${1}
SHELL_SCRIPTS_DIR="${PROJECT_DIR}/${2}"
GIT_USER_NAME=${3}
GIT_USER_EMAIL=${4}

echo "Running git-config.sh"
${SHELL_SCRIPTS_DIR}/git-config.sh ${PROJECT_DIR} ${GIT_USER_NAME} ${GIT_USER_EMAIL}

echo "Running git-files.sh"
${SHELL_SCRIPTS_DIR}/git-files.sh ${PROJECT_DIR}

echo "Running set-working-dir.sh"
${SHELL_SCRIPTS_DIR}/set-working-dir.sh ${PROJECT_DIR}
