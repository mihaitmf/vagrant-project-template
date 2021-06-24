#!/usr/bin/env bash

MYSQL_CONTAINER_NAME=vagrant-project-template-mysql

echo "*** Removing original mysql container"
docker rm -f "${MYSQL_CONTAINER_NAME}" || true

if ! docker inspect ${MYSQL_CONTAINER_NAME} &>/dev/null; then
  MYSQL_SERVER_VERSION=5.7
  MYSQL_USER=devuser
  MYSQL_PASS=withc--
  MYSQL_EXPOSE_LOCAL_PORT=3306

  docker run \
    --detach \
    --restart on-failure:3 \
    --publish "${MYSQL_EXPOSE_LOCAL_PORT}":3306 \
    --name "${MYSQL_CONTAINER_NAME}" \
    --env MYSQL_ROOT_PASSWORD="${MYSQL_PASS}" \
    --env MYSQL_USER="${MYSQL_USER}" \
    --env MYSQL_PASSWORD="${MYSQL_PASS}" \
    percona:"${MYSQL_SERVER_VERSION}-centos"
else
  docker restart "${MYSQL_CONTAINER_NAME}"
fi
