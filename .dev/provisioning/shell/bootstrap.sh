#!/usr/bin/env bash

PROJECT_DIR=${1}
GIT_USER_NAME=${2}
GIT_USER_EMAIL=${3}

SHELL_SCRIPTS_DIR="${PROJECT_DIR}/.dev/provisioning/shell"

${SHELL_SCRIPTS_DIR}/git-config.sh ${PROJECT_DIR} ${GIT_USER_NAME} ${GIT_USER_EMAIL}
${SHELL_SCRIPTS_DIR}/git-files.sh ${PROJECT_DIR}
${SHELL_SCRIPTS_DIR}/set-working-dir.sh ${PROJECT_DIR}
