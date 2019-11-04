#!/usr/bin/env bash

SHELL_SCRIPTS_DIR=$(dirname "$(realpath $0)")

# Install kubectl if not exists
VERSION=`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`
BINARY_NAME="kubectl"
DOWNLOAD_URL="https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl"
SOURCES_DIR="/opt/${BINARY_NAME}"
SOURCES_BIN_DIR="${SOURCES_DIR}"

if type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "${BINARY_NAME} already exists, skipping..."
    exit 0
fi

echo "Installing ${BINARY_NAME}..."

# Download
rm -r ${SOURCES_DIR} >/dev/null 2>&1
mkdir ${SOURCES_DIR}
curl -sSL ${DOWNLOAD_URL} -o ${SOURCES_BIN_DIR}/${BINARY_NAME}

# Give "execute" permission
chmod a+x ${SOURCES_BIN_DIR}/${BINARY_NAME}

# Add binary to $PATH
${SHELL_SCRIPTS_DIR}/functions/add-binary-to-path-function.sh \
    ${BINARY_NAME} \
    ${SOURCES_BIN_DIR}

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

#kubectl version

exit 0
