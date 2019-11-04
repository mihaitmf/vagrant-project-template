#!/usr/bin/env bash

FUNCTIONS_DIR=$(dirname $(realpath $0))

BINARY_NAME=${1}
DOWNLOAD_URL=${2}
ARCHIVE_FILE_NAME=${3}
SOURCES_DIR=${4}
SOURCES_BIN_DIR=${5}

# If package already exists, skip installation
if type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "${BINARY_NAME} already exists, skipping..."
    exit 0
fi

echo "Installing ${BINARY_NAME}..."

# Download
wget ${DOWNLOAD_URL} -O ${ARCHIVE_FILE_NAME} >/dev/null 2>&1

# Extract
rm -r ${SOURCES_DIR} >/dev/null 2>&1
mkdir ${SOURCES_DIR}

if [[ ${ARCHIVE_FILE_NAME: -4} ==  ".zip" ]]; then
    unzip ${ARCHIVE_FILE_NAME} -d ${SOURCES_DIR} >/dev/null
elif [[ ${ARCHIVE_FILE_NAME: -7} ==  ".tar.gz" ]]; then
    tar -zxvf ${ARCHIVE_FILE_NAME} -C ${SOURCES_DIR} >/dev/null
else
    echo "Error! Unknown format for archive file ${ARCHIVE_FILE_NAME}"
    exit 1
fi

rm -f ${ARCHIVE_FILE_NAME}

# Add binary to $PATH
${FUNCTIONS_DIR}/add-binary-to-path-function.sh \
    ${BINARY_NAME} \
    ${SOURCES_BIN_DIR}

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

exit 0
