#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=ES/ST=Barcelona/L=Barcelona/O=wordpress/CN=jgravalo.42.fr";
echo "Nginx: ssl is set up!";

echo
echo www/:
ls /var/www/

echo
echo www/html:
ls /var/www/html/
echo
echo certs:
ls /etc/ssl/certs/
echo
echo private:
ls /etc/ssl/private/
echo
cat /var/www/html/index.html

exec "$@"
