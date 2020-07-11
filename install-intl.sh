#!/bin/sh

#docker-php-ext-configure intl && \
docker-compose exec wordpress ash -c 'apk add icu-dev && \
    docker-php-ext-install intl && \ 
    docker-php-ext-enable intl && \
    echo "👍 PHP Intl successfully installed" && \
    echo "😎 Restarting wordpress container to reflect the changes"'

docker-compose restart wordpress