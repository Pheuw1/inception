FROM	alpine:3.15

RUN		apk update

RUN		apk add --no-cache --quiet --update nginx
RUN		apk add --no-cache --quiet --update openssl

RUN		mkdir -p /etc/nginx/ssl

# Generation des certificats et cles au nom du student
RUN 	 openssl req -x509 -nodes \
		-out /etc/nginx/ssl/gmehdevi.42.fr.crt \	
		-keyout /etc/nginx/ssl/gmehdevi.42.fr.key \
		-subj "/C=FR/ST=IDF/L=Nice/O=42/OU=42/CN=gmehdevi.42.fr/UID=gmehdevi"

RUN 	mkdir -p /var/run/nginx

COPY	./nginx.conf /etc/nginx/http.d/default.conf

EXPOSE	443

CMD	[ "nginx", "-g", "daemon off;" ]
