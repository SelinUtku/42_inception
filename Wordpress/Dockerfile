FROM debian:11

EXPOSE 9000

RUN apt update \
	&& apt install -y wget \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN mkdir -p /var/www/html/wordpress


RUN cd /usr/local/bin/ \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& mv wp-cli.phar wp \
	&& chmod +x wp \
	&& mkdir -p  /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/

COPY wp-config.sh /wp-config.sh

ENTRYPOINT [ "/bin/bash", "/wp-config.sh" ]

COPY wp-config.php /wp-config.php

CMD ["php-fpm7.4", "-F"]