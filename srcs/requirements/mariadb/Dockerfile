FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install mariadb-server -y
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY startup.sh .

RUN chmod +x /startup.sh

ENV SQL_DB=db
ENV SQL_USER=user1
ENV SQL_PWD=password
ENV SQL_ROOT_PWD=root

ENTRYPOINT [ "sh", "startup.sh" ]