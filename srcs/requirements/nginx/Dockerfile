FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install nginx openssl -y


WORKDIR /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 \
				-nodes \
 				-x509 \
 				-keyout key.key \
				-out cert.crt \
				-days 365 \
				-subj "/C=CA/ST=QC/L=QC/O=42/OU=Quebec/CN=localhost"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]