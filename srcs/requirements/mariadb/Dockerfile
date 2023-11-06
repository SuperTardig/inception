FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY startup.sh .

ENTRYPOINT [ "sh", "startup.sh" ]