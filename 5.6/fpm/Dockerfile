FROM php:5.6-fpm

ENV DRUSH_VERSION 8.1.2
ENV APP_ROOT /var/www/html

RUN apt-get clean -y
# Install the PHP extensions we need

RUN apt-get update && \
apt-get install -y --no-install-recommends \
    curl \
    mysql-client \
    libmemcached-dev \
    libz-dev \
    libzip-dev \
    libpq-dev \
    libjpeg-dev \
    libpng12-dev \
    libfreetype6-dev \
    libicu-dev \
    libssl-dev \
    libmemcached-dev \
    zlib1g-dev \
    libmcrypt-dev && \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr && \
    docker-php-ext-install gd pdo_mysql mysqli opcache intl bcmath zip mcrypt sockets && \
    docker-php-ext-enable bcmath zip pdo_mysql mcrypt sockets

# drush command
RUN curl -fsSL -o /usr/local/bin/drush "https://github.com/drush-ops/drush/releases/download/$DRUSH_VERSION/drush.phar" && \
    chmod +x /usr/local/bin/drush

# install composer
RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# config china mirror
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

VOLUME $APP_ROOT
WORKDIR $APP_ROOT