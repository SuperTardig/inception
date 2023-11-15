FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY startup.sh .

ENTRYPOINT [ "sh", "startup.sh" ]