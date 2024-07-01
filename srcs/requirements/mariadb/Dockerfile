FROM debian:10.11

RUN apt-get update && apt-get install -y mariadb-server

#COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb.sh /

RUN mkdir -p /var/run/mysqld/ && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld/ 

EXPOSE 3306

#RUN service mysql start

#RUN mysql_install_db

ENTRYPOINT ["./mariadb.sh"]
