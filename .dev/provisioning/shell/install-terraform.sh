#!/usr/bin/env bash

SHELL_SCRIPTS_DIR=$(dirname "$(realpath $0)")

# Install terraform if not exists
VERSION="0.11.14"
BINARY_NAME="terraform"
DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip"
ARCHIVE_FILE_NAME="${BINARY_NAME}.zip"
SOURCES_DIR="/opt/${BINARY_NAME}"
SOURCES_BIN_DIR="${SOURCES_DIR}"

${SHELL_SCRIPTS_DIR}/functions/install-package-function.sh \
    ${BINARY_NAME} \
    ${DOWNLOAD_URL} \
    ${ARCHIVE_FILE_NAME} \
    ${SOURCES_DIR} \
    ${SOURCES_BIN_DIR}

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

#terraform --version

exit 0
