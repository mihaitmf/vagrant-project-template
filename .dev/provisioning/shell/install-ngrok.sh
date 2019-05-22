#!/usr/bin/env bash

SHELL_SCRIPTS_DIR="${1}"

# Install ngrok if not exists
BINARY_NAME="ngrok"
DOWNLOAD_URL="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip"
ARCHIVE_FILE_NAME="${BINARY_NAME}.zip"
SOURCES_DIR="/opt/${BINARY_NAME}"
SOURCES_BIN_DIR="${SOURCES_DIR}"
STARTUP_CONFIG_FILE="/etc/profile.d/${BINARY_NAME}.sh"

${SHELL_SCRIPTS_DIR}/install-package-function.sh \
    ${BINARY_NAME} \
    ${DOWNLOAD_URL} \
    ${ARCHIVE_FILE_NAME} \
    ${SOURCES_DIR} \
    ${SOURCES_BIN_DIR} \
    ${STARTUP_CONFIG_FILE}

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

# Check installation
if ! type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "Error installing ${BINARY_NAME}"
    exit 1
fi
