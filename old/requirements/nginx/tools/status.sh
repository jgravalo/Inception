#!/bin/bash

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
echo
echo
cat /etc/nginx/sites-enabled/default

exec "$@"
