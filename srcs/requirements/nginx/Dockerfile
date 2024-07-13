FROM debian:10.11

RUN apt-get update && \
	apt-get install -y \
	nginx openssl

COPY ./tools/index.html /var/www/html/index.html
COPY ./tools/nginx.sh /var/www/
COPY ./conf/default /etc/nginx/sites-enabled/default

RUN chmod +x /var/www/nginx.sh

EXPOSE 80

EXPOSE 443

ENTRYPOINT ["/var/www/nginx.sh"]

CMD ["nginx", "-g", "daemon off;"]
