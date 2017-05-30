#!/bin/sh

# start nginx
if [ "$1" = 'nginx' ]; then
    nginx -g daemon off
fi

# start php-fpm
if [ "$2" = 'php-fpm' ]; then
    php-fpm
fi