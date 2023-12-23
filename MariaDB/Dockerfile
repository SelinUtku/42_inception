
FROM alpine:3.18

RUN apk update && apk add mariadb mariadb-client

COPY maria.cnf /etc/my.cnf

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "./entrypoint.sh", "mysqld_safe"]