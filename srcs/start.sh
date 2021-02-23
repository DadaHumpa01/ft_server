wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz

mv phpMyAdmin-4.9.7-all-languages/ phpmyadmin
mv phpmyadmin /var/www/html
rm phpMyAdmin-4.9.7-all-languages.tar.gz

service mysql start
service php7.3-fpm start

echo "CREATE DATABASE wpdb;" | mysql -u root --skip-password
echo "CREATE USER 'wpuser'@'localhost' identified by 'dbpassword';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mkdir etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/42roma.pem -keyout /etc/nginx/ssl/42roma.key -subj "/C=IT/ST=Napoli/L=Napoli/O=42 School/OU=Napoleone/CN=42roma"

wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/html
mv /tmp/wp-config.php /var/www/html/wordpress
rm latest.tar.gz

service php7.3-fpm start
service nginx start

bin/bash
