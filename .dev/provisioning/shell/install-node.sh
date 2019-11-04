#!/usr/bin/env bash

# Install node and npm
apt install -y nodejs npm >/dev/null

# Check installation
if ! type node >/dev/null 2>&1; then
    echo "Error installing nodejs"
    exit 1
fi
if ! type npm >/dev/null 2>&1; then
    echo "Error installing npm"
    exit 1
fi

#node -v
#npm -v

exit 0
