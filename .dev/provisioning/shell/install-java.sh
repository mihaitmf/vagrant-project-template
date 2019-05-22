#!/usr/bin/env bash

JAVA_VERSION=8

# Install java
apt install -y openjdk-${JAVA_VERSION}-jdk >/dev/null

# Setup environment variables
cat > /etc/profile.d/java.sh <<EOL
export JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64
EOL

java -version
echo ${JAVA_HOME}
