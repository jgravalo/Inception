FROM debian:10.11

RUN apt-get update && \
	apt-get install -y \
	nginx openssl

RUN rm /var/www/html/index.nginx-debian.html

COPY ./tools/nginx.sh /var/www/
COPY ./tools/status.sh /var/www/

COPY ./tools/index.html /var/www/html/
COPY ./conf/default /etc/nginx/sites-enabled/default

RUN chmod +x /var/www/nginx.sh

EXPOSE 80

EXPOSE 443

ENTRYPOINT ["/var/www/nginx.sh"]

RUN ls

CMD ["nginx", "-g", "daemon off;"]
