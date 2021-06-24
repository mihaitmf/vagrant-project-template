#!/usr/bin/env bash

PROJECT_DIR=${1}
SCRIPTS_DIR=${PROJECT_DIR}/.dev/docker

# build docker images
"${SCRIPTS_DIR}"/build/build-all.sh

# use php from a docker container
ln --force --symbolic ${SCRIPTS_DIR}/run/php/run-php-container.sh /usr/bin/php
php -v
php -m

# use composer from a docker container
ln --force --symbolic ${SCRIPTS_DIR}/run/composer/run-composer-container.sh /usr/bin/composer
composer -V

# start services
"${SCRIPTS_DIR}"/run/apache-php/run-apache-container.sh
"${SCRIPTS_DIR}"/run/mysql/run-mysql-container.sh
