FROM debian:11.9

RUN apt-get update && apt-get -y install \
    curl \
    php7.4-fpm \
    php7.4-mysqli \
    mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php
RUN chmod 755 /run/php

COPY ./tools/wp.sh /usr/local/bin/wp.sh
RUN chmod +x /usr/local/bin/wp.sh
COPY ./tools/start.sh /var/www/start.sh

EXPOSE 9000

WORKDIR /var/www/html/

ENTRYPOINT [ "/usr/local/bin/wp.sh" ]
