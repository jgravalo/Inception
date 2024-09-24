#! /bin/bash

if [ -f ./wp-config.php ]
then
	echo "Wordpress already exists"
else
	# descargar wp
	wp core download --allow-root
	# crea el archivo wp_config.php con los datos que se pasan
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --allow-root
	# instalar wordpress
	wp core install --url=$DOMAIN --title="$WP_TITLE" --admin_user=$WP_ADMIM --admin_password=$WP_ADMIM_PASS  --admin_email=$WP_ADMIM_EMAIL --skip-email --allow-root
	# crear un usuario
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root
	# instalar y crear un tema
	wp theme install twentysixteen --activate --allow-root
fi

/usr/sbin/php-fpm7.3 -F; #iniciar php_fpm