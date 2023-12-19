#!/bin/bash

sleep 5
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "WARNING: wordpress already configured";
else
	wp --allow-root core download
	mv /wp-config.php /var/www/html/wordpress/
	wp --allow-root core install --url=localhost --title=inception --admin_user=sutku --admin_password=123 --admin_email=noemail@noemail.com --allow-root
fi

exec $@