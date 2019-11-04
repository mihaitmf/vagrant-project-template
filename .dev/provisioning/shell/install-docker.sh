#!/usr/bin/env bash

# Install docker if not exists
if systemctl is-active --quiet docker; then
    echo "Docker is already installed and running, skipping..."
    exit 0
fi

# Install a few prerequisite packages which let apt use packages over HTTPS:
apt install apt-transport-https ca-certificates curl software-properties-common

# Then add the GPG key for the official Docker repository to your system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add the Docker repository to APT sources:
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Next, update the package database with the Docker packages from the newly added repo:
apt update

# Finally, install Docker:
apt install -y docker-ce

# Check installation
if ! systemctl is-active --quiet docker; then
    echo "Error installing docker"
    exit 1
fi

# Add vagrant user to the docker group so that docker commands do not require sudo
usermod -a -G docker vagrant

exit 0
