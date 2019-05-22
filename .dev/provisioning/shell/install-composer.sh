#!/usr/bin/env bash

# Install composer if not exists
BINARY_NAME="composer"
SOURCES_DIR="/opt/${BINARY_NAME}"
SOURCES_BIN_DIR="${SOURCES_DIR}"
STARTUP_CONFIG_FILE="/etc/profile.d/${BINARY_NAME}.sh"

# If package already exists, skip installation
if type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "${BINARY_NAME} already exists, skipping..."
    exit 0
fi

# Download
sudo mkdir ${SOURCES_DIR}
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/opt/composer/ --filename=composer
rm composer-setup.php

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

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

#composer -V

exit 0
