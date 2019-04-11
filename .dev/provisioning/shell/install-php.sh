#!/usr/bin/env bash

# Install php and apache
apt install -y php >/dev/null

# Install php extensions
apt install -y php-xdebug php-curl php-xml php-soap php-bcmath php-mbstring php-apcu php-memcached php-mysqli >/dev/null

# Install composer if not exists
if ! type composer >/dev/null 2>&1; then
    curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer >/dev/null \
    && rm composer-setup.php
fi

#php -v
#systemctl status apache2
#composer -V
