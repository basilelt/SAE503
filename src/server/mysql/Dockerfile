FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=minecraft
ENV MYSQL_USER=minecraft
ENV MYSQL_PASSWORD=minecraft

COPY my.cnf /etc/mysql/my.cnf
COPY grant_privileges.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

RUN echo "CREATE DATABASE IF NOT EXISTS bans;" > /docker-entrypoint-initdb.d/create_bans_db.sql