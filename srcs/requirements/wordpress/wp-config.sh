#!/bin/bash

sleep 5
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "WARNING: wordpress already configured";
else
	wp --allow-root core download
	wp --allow-root config create --dbname=$WP_DB --dbuser=$WP_USER --dbpass=$WP_PASS --dbhost=mariadb
	wp --allow-root core install --url=sutku.42.fr --title=inception --admin_user=$WP_ADMIN --admin_password=$WP_ADPASS --admin_email=$WP_ADMAIL --skip-email
	wp --allow-root user create test test@test.com --user_pass=$TEST_PASS
fi

exec $@