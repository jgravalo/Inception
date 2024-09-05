FROM debian:oldstable

RUN apt-get update && \
	apt-get install -y \
	nginx openssl

RUN rm /var/www/html/index.nginx-debian.html

#COPY ./tools/status.sh /var/www/
COPY ./tools/nginx.sh /var/www/
RUN chmod +x /var/www/nginx.sh

COPY ./tools/index.html /var/www/html/
COPY ./conf/default /etc/nginx/sites-enabled/default

EXPOSE 80

EXPOSE 443

ENTRYPOINT ["/var/www/nginx.sh"]

CMD ["nginx", "-g", "daemon off;"]
