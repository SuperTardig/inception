FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx openssl -y

RUN mkdir -p /var/run/nginx

WORKDIR /etc/nginx/ssl
RUN openssl req -x509 \
		-nodes \
		-out cert.crt \
 		-keyout key.key \
		-subj "/C=CA/ST=QC/L=QC/O=42/OU=42/CN=42.bperron.fr/UID=bperron"

COPY conf/nginx.conf /etc/nginx/

CMD [ "nginx", "-g", "daemon off;" ]
