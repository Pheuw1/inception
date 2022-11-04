FROM	alpine:3.15

RUN		apk update
RUN		apk add --no-cache --quiet --update curl bash vim
RUN		apk add --no-cache --quiet --update mariadb-client
RUN		apk add --no-cache --quiet --update php7 php-phar \
			php-json php-curl php-fpm php-mysqli php-iconv

RUN		mkdir -p /var/www/wordpress 

RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp 
RUN		chmod +x ./usr/bin/wp 

RUN		wp core download --path=/var/www/wordpress

WORKDIR /var/www/wordpress

COPY	./wp-config /config/wp-config

COPY	./entrypoint.sh /tmp/entrypoint.sh
RUN		chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]