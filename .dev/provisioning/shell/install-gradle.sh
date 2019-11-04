#!/usr/bin/env bash

SHELL_SCRIPTS_DIR=$(dirname "$(realpath $0)")

# Install gradle if not exists
VERSION="5.4"
BINARY_NAME="gradle"
DOWNLOAD_URL="https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip"
ARCHIVE_FILE_NAME="${BINARY_NAME}.zip"
SOURCES_DIR="/opt/${BINARY_NAME}"
SOURCES_BIN_DIR="${SOURCES_DIR}/gradle-${VERSION}/bin"

${SHELL_SCRIPTS_DIR}/functions/install-package-function.sh \
    ${BINARY_NAME} \
    ${DOWNLOAD_URL} \
    ${ARCHIVE_FILE_NAME} \
    ${SOURCES_DIR} \
    ${SOURCES_BIN_DIR}

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

#gradle -v

exit 0
