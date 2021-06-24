ARG PHP_VERSION=8.0
#ARG PHP_VERSION=7.4

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
