#!/usr/bin/env bash

# Install packages
apt update
apt upgrade -y
apt install -y software-properties-common build-essential htop vim curl net-tools

# Install java and maven
: '
apt install -y openjdk-11-jdk maven
cat > /etc/profile.d/apache-maven.sh <<EOL
# Apache Maven Environment Variables
# MAVEN_HOME for Maven 1 - M2_HOME for Maven 2
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export M2_HOME=/usr/local/apache-maven-3.5.4
export MAVEN_HOME=\$M2_HOME
export M2=\$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=\$M2:$PATH
EOL
source /etc/profile.d/apache-maven.sh
'
#java --version
#mvn -v
#echo $JAVA_HOME
#echo $M2


#apt install -y php
#apt install -y nodejs
#apt install -y npm
