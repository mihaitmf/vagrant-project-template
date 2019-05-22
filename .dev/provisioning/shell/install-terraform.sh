#!/usr/bin/env bash

SHELL_SCRIPTS_DIR="${1}"

# Install terraform if not exists
BINARY_NAME="terraform"
DOWNLOAD_URL="https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip"
ARCHIVE_FILE_NAME="${BINARY_NAME}.zip"
SOURCES_DIR="${BINARY_NAME}"
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

#terraform --version

exit 0
