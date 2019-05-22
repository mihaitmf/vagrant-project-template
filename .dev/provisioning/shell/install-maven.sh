#!/usr/bin/env bash

SHELL_SCRIPTS_DIR="${1}"

# Install maven if not exists
VERSION="3.6.1"
BINARY_NAME="mvn"
DOWNLOAD_URL="http://mirrors.m247.ro/apache/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz"
ARCHIVE_FILE_NAME="apache-maven.tar.gz"
SOURCES_DIR="/opt/apache-maven"
SOURCES_BIN_DIR="${SOURCES_DIR}/apache-maven-${VERSION}/bin"
STARTUP_CONFIG_FILE="/etc/profile.d/apache-maven.sh"

${SHELL_SCRIPTS_DIR}/install-package-function.sh \
    ${BINARY_NAME} \
    ${DOWNLOAD_URL} \
    ${ARCHIVE_FILE_NAME} \
    ${SOURCES_DIR} \
    ${SOURCES_BIN_DIR} \
    ${STARTUP_CONFIG_FILE}

test $? -ne 0 && exit 1 # If last command returned error (non zero exit code), exit this script with error also

# Add extra env variables
cat > ${STARTUP_CONFIG_FILE} <<EOL
# Apache Maven Environment Variables
export M2_HOME=${SOURCES_DIR}/apache-maven-${VERSION}
export MAVEN_HOME=\$M2_HOME
export M2=\$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=\$PATH:\$M2
EOL

# Load environment variables
source ${STARTUP_CONFIG_FILE}

# Check installation
if [[ "${M2_HOME}" != "${SOURCES_DIR}/apache-maven-${VERSION}" ]]; then
    echo "Error setting M2_HOME"
    exit 1
fi

#mvn -v
#echo ${M2_HOME}
