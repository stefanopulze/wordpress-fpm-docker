#!/bin/sh

docker-compose exec wordpress ash -c 'apk --update --no-cache add autoconf g++ make libmemcached-dev zlib-dev && \
    cd /var/www/html && \
    pecl install memcached && \
    docker-php-ext-enable memcached && \
    echo "👍 Memcached successfully installed" && \
    echo "😎 Restarting wordpress container to reflect the changes"'

docker-compose restart wordpress