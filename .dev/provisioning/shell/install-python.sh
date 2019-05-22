#!/usr/bin/env bash

# Install python and pip
apt install -y python python-dev python3 python3-dev python-pip >/dev/null

# Check installation
if ! type python >/dev/null 2>&1; then
    echo "Error installing python"
    exit 1
fi
if ! type python3 >/dev/null 2>&1; then
    echo "Error installing python3"
    exit 1
fi
if ! type pip >/dev/null 2>&1; then
    echo "Error installing pip"
    exit 1
fi

#python -V
#python3 -V
#pip -V
