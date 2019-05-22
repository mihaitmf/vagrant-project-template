#!/usr/bin/env bash

# Install aws cli
apt install -y awscli >/dev/null

# Check installation
if ! type aws >/dev/null 2>&1; then
    echo "Error installing awscli"
    exit 1
fi

#aws help
