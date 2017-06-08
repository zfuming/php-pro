FROM php:7.1-fpm

RUN apt-get update \
	&& apt-get install -y --no-install-recommends nginx \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

STOPSIGNAL SIGTERM

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
COPY docker-php-run /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-php-run

RUN mkdir /usr/local/var/log/nginx

EXPOSE 80 443 9000

CMD ["docker-php-run"]