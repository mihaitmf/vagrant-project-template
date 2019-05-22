#!/usr/bin/env bash

JAVA_VERSION=8
JAVA_HOME_DIR="/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64"
STARTUP_CONFIG_FILE="/etc/profile.d/java.sh"

# Install java
apt install -y openjdk-${JAVA_VERSION}-jdk >/dev/null

# Setup environment variables
cat > ${STARTUP_CONFIG_FILE} <<EOL
export JAVA_HOME=${JAVA_HOME_DIR}
EOL

# Load environment variables
source ${STARTUP_CONFIG_FILE}

# Check installation
if ! type java >/dev/null 2>&1; then
    echo "Error installing java"
    exit 1
fi
if [[ "${JAVA_HOME}" != "${JAVA_HOME_DIR}" ]]; then
    echo "Error setting JAVA_HOME"
    exit 1
fi

#java -version
#echo ${JAVA_HOME}
