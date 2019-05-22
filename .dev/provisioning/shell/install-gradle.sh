#!/usr/bin/env bash

SHELL_SCRIPTS_DIR="${1}"

# Install gradle if not exists
BINARY_NAME="gradle"
DOWNLOAD_URL="https://services.gradle.org/distributions/gradle-5.4-bin.zip"
ARCHIVE_FILE_NAME="${BINARY_NAME}.zip"
SOURCES_DIR="/opt/${BINARY_NAME}"
STARTUP_CONFIG_FILE="/etc/profile.d/${BINARY_NAME}"

${SHELL_SCRIPTS_DIR}/install-package-function.sh \
    ${BINARY_NAME} \
    ${DOWNLOAD_URL} \
    ${ARCHIVE_FILE_NAME} \
    ${SOURCES_DIR} \
    ${STARTUP_CONFIG_FILE}

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

gradle -v
