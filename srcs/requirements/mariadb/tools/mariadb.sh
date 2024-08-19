#!/bin/bash

service mysql start

if [ ! -d /var/lib/mysql/${DB_NAME} ];
then
	# crear base de datos con usuario root
	mysql -u ${DB_ROOT_USER} -p${DB_ROOT_PASS} -e "CREATE DATABASE $DB_NAME;"
	# crear usuario
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'"
	# otorgar permisos
	mysql -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;"
	# recargar privilegios
	mysql -e "FLUSH PRIVILEGES;"
	# cambiar contraseña root
	mysql -e "ALTER USER '${DB_ROOT_USER}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
fi

mysqladmin -u ${DB_ROOT_USER} --password=${DB_ROOT_PASS} shutdown # apaga el servidor

mysqld # enciende el servidor en demonio (segundo plano)
