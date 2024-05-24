# https://hub.docker.com/_/mariadb/tags
FROM mariadb:11.4.1-rc

COPY init.sql /docker-entrypoint-initdb.d/
