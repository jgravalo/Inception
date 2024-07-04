FROM debian:10.11

RUN apt-get update && \
	apt-get install -y \
	nginx

COPY /var/www/html /var/www/
#COPY ./tools/nginx.sh /var/www/
#COPY ./conf/default /etc/nginx/sites-enabled/default
COPY /etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
