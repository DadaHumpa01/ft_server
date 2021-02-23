FROM	debian:buster

RUN     apt update
RUN     apt upgrade	-y
RUN	apt install wget -y
RUN	apt install nginx -y
RUN	apt install mariadb-server -y
RUN 	apt install php-mbstring php-zip php-gd php-mysql php7.3-fpm -y

COPY	./srcs/default ./etc/nginx/sites-available
COPY	./srcs/start.sh ./
COPY	./srcs/wp-config.php ./tmp/wp-config.php

CMD	bash start.sh
