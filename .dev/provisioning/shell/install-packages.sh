#!/usr/bin/env bash

# Install packages
apt update
apt install -y software-properties-common build-essential htop vim curl net-tools unzip

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
export PATH=\$M2:\$PATH
EOL
source /etc/profile.d/apache-maven.sh
'
#java --version
#mvn -v
#echo $JAVA_HOME
#echo $M2

# Install php and composer
: '
apt install -y php
apt install -y php-curl php-json php-xml php-soap php-bcmath php-gd php-mbstring php-readline php-apcu php-memcached php-xdebug
curl -sS https://getcomposer.org/installer -o composer-setup.php && php composer-setup.php --install-dir=/usr/local/bin --filename=composer && rm composer-setup.php
'
#php -v
#systemctl status apache2
#composer -V

# Install node.js and npm
#apt install -y nodejs npm
#node -v
#npm -v

# Install python and pip
#apt install -y python python3 python-pip
#python -V
#python3 -V
#pip -V

# Install terraform
#wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
#unzip terraform_0.11.13_linux_amd64.zip
#mv terraform /usr/local/bin/
#rm -f terraform_0.11.13_linux_amd64.zip
#terraform --version
