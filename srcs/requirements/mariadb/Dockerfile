FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY startup.sh .

RUN chmod +x /startup.sh

ENV SQL_DATABASE=db
ENV SQL_USER=user1
ENV SQL_PASSWORD=password
ENV SQL_ROOT_PASSWORD=root

ENTRYPOINT [ "sh", "startup.sh" ]