#!/usr/bin/env bash

PROJECT_DIR=${1}
SHELL_SCRIPTS_DIR="${PROJECT_DIR}/${2}"

echo "Install commonly used packages"
apt update >/dev/null
apt install -y software-properties-common build-essential htop vim curl net-tools unzip >/dev/null

echo "Running install-java.sh"
${SHELL_SCRIPTS_DIR}/install-java.sh

echo "Running install-php.sh"
${SHELL_SCRIPTS_DIR}/install-php.sh

echo "Running install-node.sh"
${SHELL_SCRIPTS_DIR}/install-node.sh

echo "Running install-python.sh"
${SHELL_SCRIPTS_DIR}/install-python.sh

echo "Running install-terraform.sh"
${SHELL_SCRIPTS_DIR}/install-terraform.sh
