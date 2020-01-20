#!/bin/sh

docker-compose exec wordpress ash -c 'apk --update --no-cache add autoconf g++ make && \
    cd /var/www/html && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make && \
    echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_host = host.docker.internal" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_log=/tmp/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.idekey = PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "👍 Xdebug successfully installed" && \
    echo "😎 Restarting wordpress container to reflect the changes"'

docker-compose restart wordpress