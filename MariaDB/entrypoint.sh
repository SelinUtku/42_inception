#!/bin/sh

export PATH=$PATH:/usr/bin

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
# Initialize MariaDB data directory
mysql_install_db --user=mysql --ldata=/var/lib/mysql/

# Start MariaDB service
mysqld --user=mysql &

Wait until MariaDB is up
until mysqladmin ping >/dev/null 2>&1; do
    echo -n "."; sleep 1
done

Create a database and grant privileges
WP_DB="wordpress"
WP_USER="wpuser"
WP_PASS="wppassword"

if ! mysql -u root -e "USE $WP_DB" > /dev/null 2>&1;
then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $WP_DB;"
    mysql -u root -e "GRANT ALL ON $WP_DB.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS'; FLUSH PRIVILEGES;"
    echo "Database '$WP_DB' created with user '$WP_USER' (password: '$WP_PASS')"
else
    echo "WARNING: Database '$WP_DB' already exists"
fi

wait
# Stop MariaDB
mysqladmin -u root shutdown

# Execute any command provided to the script
exec "$@"
