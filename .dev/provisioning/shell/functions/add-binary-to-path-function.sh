#!/usr/bin/env bash

BINARY_NAME=${1}
SOURCES_BIN_DIR=${2}
STARTUP_CONFIG_FILE="/etc/profile.d/${BINARY_NAME}.sh"

# If package already exists, skip
if type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "${BINARY_NAME} already exists, skipping..."
    exit 0
fi

echo "Adding ${BINARY_NAME} to PATH..."

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
