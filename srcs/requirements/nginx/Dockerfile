FROM debian:10.11

RUN apt-get update && \
	apt-get install -y \
	nginx-core

COPY ./tools/mariadb.sh /

CMD ["/mariadb.sh"]
