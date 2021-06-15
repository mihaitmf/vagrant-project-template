#!/usr/bin/env bash

CLI_PHP_VERSION=8.0.5
IMAGE_NAME=php:${CLI_PHP_VERSION}
#IMAGE_NAME=vagrant-project-template/php:latest

# needed to sync working directory
HOST_WORK_DIR=$(realpath $(dirname $(readlink -f "$0"))/../../..)
CONTAINER_WORK_DIR=${HOST_WORK_DIR}

# needed to sync php config file
CONFIG_DIR=${HOST_WORK_DIR}/.dev/docker/run/config
HOST_CONFIG_FILE_PATH=${CONFIG_DIR}/custom-php.ini
CONTAINER_CONFIG_FILE_PATH=/usr/local/etc/php/conf.d/custom-php.ini

# needed for using Remote PHP Interpreter in IDE
PHPSTORM_HELPERS_DIR=/home/vagrant/.phpstorm_helpers

# needed for using XDebug from the IDE
SETTINGS_ENV_FILE_PATH=${CONFIG_DIR}/xdebug_settings.env

docker run --rm \
    --workdir ${CONTAINER_WORK_DIR} \
    --volume ${HOST_WORK_DIR}:${CONTAINER_WORK_DIR} \
    --volume ${HOST_CONFIG_FILE_PATH}:${CONTAINER_CONFIG_FILE_PATH} \
    --volume ${PHPSTORM_HELPERS_DIR}:${PHPSTORM_HELPERS_DIR} \
    --env-file ${SETTINGS_ENV_FILE_PATH} \
    --net host \
    --user "$(id -u vagrant)":"$(id -g vagrant)" \
    ${IMAGE_NAME} "$@"

## Use this to debug inside the container
#docker run -it --entrypoint bash \
#    --workdir ${CONTAINER_WORK_DIR} \
#    --volume ${HOST_WORK_DIR}:${CONTAINER_WORK_DIR} \
#    --volume ${HOST_CONFIG_FILE_PATH}:${CONTAINER_CONFIG_FILE_PATH} \
#    --volume ${PHPSTORM_HELPERS_DIR}:${PHPSTORM_HELPERS_DIR} \
#    --env-file ${SETTINGS_ENV_FILE_PATH} \
#    --net host \
#    --user "$(id -u vagrant)":"$(id -g vagrant)" \
#    ${IMAGE_NAME}
