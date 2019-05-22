#!/usr/bin/env bash

BINARY_NAME=${1}
DOWNLOAD_URL=${2}
ARCHIVE_FILE_NAME=${3}
SOURCES_DIR=${4}
SOURCES_BIN_DIR=${5}
STARTUP_CONFIG_FILE=${6}

# If package already exists, skip installation
if type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "${BINARY_NAME} already exists, skipping..."
    exit 0
fi

echo "Installing ${BINARY_NAME}..."

# Download
wget ${DOWNLOAD_URL} -O ${ARCHIVE_FILE_NAME} >/dev/null 2>&1

# Extract
rm -r ${SOURCES_DIR}
mkdir ${SOURCES_DIR}

if [[ ${ARCHIVE_FILE_NAME: -4} ==  ".zip" ]]; then
    unzip ${ARCHIVE_FILE_NAME} ${SOURCES_DIR} >/dev/null
elif [[ ${ARCHIVE_FILE_NAME: -7} ==  ".tar.gz" ]]; then
    tar -zxvf ${ARCHIVE_FILE_NAME} -C ${SOURCES_DIR} >/dev/null
else
    echo "Error! Unknown format for archive file ${ARCHIVE_FILE_NAME}"
    exit 1
fi

rm -f ${ARCHIVE_FILE_NAME}

# Add binary to $PATH
cat > ${STARTUP_CONFIG_FILE} <<EOL
export PATH=\$PATH:${SOURCES_BIN_DIR}
EOL

chmod a+x ${STARTUP_CONFIG_FILE}

# Load environment variables
source ${STARTUP_CONFIG_FILE}

# Check installation succeeded
if ! type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "ERROR installing ${BINARY_NAME}"
    exit 1
fi

echo "DONE"

exit 0
