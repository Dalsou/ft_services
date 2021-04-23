#!/bin/sh

# Start Telegraf
telegraf & 

# Install MariaDB database
mariadb-install-db -u root

# Start the MySQL server
mysqld -u root & sleep 5

# Create Wordpress database
mysql -u root --execute="CREATE DATABASE wordpress;"

# Import wordpress database
mysql -u root wordpress < /srcs/wordpress.sql

# Create new user and give permissions.
mysql -u root --execute="CREATE USER 'user'@'%' IDENTIFIED BY 'password'; 
						 GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION; 
						 USE wordpress; 
						 FLUSH PRIVILEGES;"

# Keep container running
sleep infinite