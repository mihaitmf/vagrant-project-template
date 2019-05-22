#!/usr/bin/env bash

# Install php and apache
apt install -y php >/dev/null

# Install php extensions
apt install -y php-xdebug php-curl php-xml php-soap php-bcmath php-mbstring php-apcu php-memcached php-mysqli >/dev/null

# Check installation
if ! type php >/dev/null 2>&1; then
    echo "Error installing php"
    exit 1
fi
if ! systemctl is-active --quiet apache2; then
    echo "Error installing apache2"
    exit 1
fi

#php -v
#systemctl status apache2
