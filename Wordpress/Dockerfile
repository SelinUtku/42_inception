FROM debian:buster

EXPOSE 9000

RUN apt update \
	&& apt install -y wget \
	php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN mkdir -p /var/www/html/wordpress


RUN cd /usr/local/bin/ \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& mv wp-cli.phar wp \
	&& chmod +x wp \
	&& mkdir -p  /run/php

COPY www.conf /etc/php/7.3/fpm/pool.d/

COPY wp-config.sh /wp-config.sh

ENTRYPOINT [ "/bin/bash", "/wp-config.sh" ]

COPY wp-config.php /wp-config.php

CMD ["php-fpm7.3", "-F"]