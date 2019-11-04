#!/usr/bin/env bash

SHELL_SCRIPTS_DIR=$(dirname "$(realpath $0)")

# Install composer if not exists
BINARY_NAME="composer"
DOWNLOAD_URL="https://getcomposer.org/installer"
SOURCES_DIR="/opt/${BINARY_NAME}"
SOURCES_BIN_DIR="${SOURCES_DIR}"

# If package already exists, skip installation
if type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "${BINARY_NAME} already exists, skipping..."
    exit 0
fi

# Download
rm -r ${SOURCES_DIR} >/dev/null 2>&1
mkdir ${SOURCES_DIR}
curl -sS ${DOWNLOAD_URL} -o composer-setup.php
php composer-setup.php --install-dir=${SOURCES_DIR} --filename=composer
rm composer-setup.php

# Add binary to $PATH
${SHELL_SCRIPTS_DIR}/functions/add-binary-to-path-function.sh \
    ${BINARY_NAME} \
    ${SOURCES_BIN_DIR}

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

#composer -V

exit 0
