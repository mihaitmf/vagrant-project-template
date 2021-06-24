#!/usr/bin/env bash

SCRIPT_DIR=$(realpath "$(dirname "$0")")

docker build \
    --tag vagrant-project-template/apache:latest \
    ${SCRIPT_DIR}
