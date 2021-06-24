ARG PHP_VERSION=8.0-apache
#ARG PHP_VERSION=7.4-apache

FROM php:$PHP_VERSION

# Use the default development configuration
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Install php extensions and required system libs
RUN apt-get update \
    && apt-get install -y \
        # required for mbstring php extension
        libonig-dev \
         # required for xml php extension
        libxml2-dev \
        # required for zip php extension
        libzip-dev \
    && docker-php-ext-install \
        opcache \
        bcmath \
        pcntl \
        mbstring \
        xml \
        zip

# Install other pecl extensions
RUN pecl install \
        apcu \
    && docker-php-ext-enable \
        apcu

# Install xdebug
ARG XDEBUG_VERSION=3.0.4
#ARG XDEBUG_VERSION=2.9.8
RUN pecl install \
        xdebug-$XDEBUG_VERSION \
    && docker-php-ext-enable \
        xdebug

# Apache configuration
COPY vagrant-project-template-vhost.conf /etc/apache2/sites-available/

RUN bash -c 'rm /etc/apache2/sites-available/{000-default,default-ssl}.conf' \
    && a2dissite 000-default \
    && a2ensite vagrant-project-template-vhost \
    && a2enmod rewrite \
    && chown www-data:www-data /var/log/apache2 \
