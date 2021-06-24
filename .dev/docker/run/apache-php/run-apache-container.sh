#!/usr/bin/env bash

IMAGE_NAME=vagrant-project-template/apache:latest

PROJECT_DIR=$(realpath "$(dirname "$(readlink -f "$0")")/../../../..")
CONFIG_DIR=${PROJECT_DIR}/.dev/docker/run/php/config

# needed to sync php config file
HOST_CONFIG_FILE_PATH=${CONFIG_DIR}/custom-php.ini
CONTAINER_CONFIG_FILE_PATH=/usr/local/etc/php/conf.d/custom-php.ini

# needed for using Remote PHP Interpreter in IDE
PHPSTORM_HELPERS_DIR=/home/vagrant/.phpstorm_helpers

# needed for using XDebug from the IDE
SETTINGS_ENV_FILE_PATH=${CONFIG_DIR}/xdebug_settings.env

APACHE_CONTAINER_NAME=vagrant-project-template-apache
APACHE_EXPOSE_PORT_ON_HOST=80

echo "*** Removing original apache container"
docker rm -fv "${APACHE_CONTAINER_NAME}" || true

if ! docker inspect ${APACHE_CONTAINER_NAME} &>/dev/null; then
  docker run \
    --detach \
    --restart on-failure:3 \
    --publish "${APACHE_EXPOSE_PORT_ON_HOST}":8080 \
    --name "${APACHE_CONTAINER_NAME}" \
    --workdir ${PROJECT_DIR} \
    --volume ${PROJECT_DIR}:${PROJECT_DIR} \
    --volume ${HOST_CONFIG_FILE_PATH}:${CONTAINER_CONFIG_FILE_PATH} \
    --volume ${PHPSTORM_HELPERS_DIR}:${PHPSTORM_HELPERS_DIR} \
    --env-file ${SETTINGS_ENV_FILE_PATH} \
    --env APACHE_DOCUMENT_ROOT="${CONFIG_DIR}" \
    --user "$(id -u vagrant)":"$(id -g vagrant)" \
    ${IMAGE_NAME}
else
  docker restart "${APACHE_CONTAINER_NAME}"
fi
