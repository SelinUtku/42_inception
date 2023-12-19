
FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY maria.cnf /etc/mysql/my.cnf

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "./entrypoint.sh" ]