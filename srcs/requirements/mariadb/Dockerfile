FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY startup.sh .

RUN chmod +x /startup.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "startup.sh" ]