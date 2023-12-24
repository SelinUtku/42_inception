#!/bin/bash

while ! mysqladmin ping -h mariadb --silent; do
	sleep 1
done

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "WARNING: wordpress already configured";
else
	# Downloads the WordPress core files.
	wp --allow-root core download
	# Generates a WordPress configuration file.
	wp --allow-root config create --dbname=$WP_DB --dbuser=$WP_USER --dbpass=$WP_PASS --dbhost=mariadb
	# Installs WordPress with provided configurations.
	wp --allow-root core install --url=sutku.42.fr --title=inception --admin_user=$WP_ADMIN --admin_password=$WP_ADPASS --admin_email=$WP_ADMAIL --skip-email
	# Creates a new user
	wp --allow-root user create test test@test.com --user_pass=$TEST_PASS
fi

exec $@