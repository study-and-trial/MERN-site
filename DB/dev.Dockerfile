# https://hub.docker.com/_/mariadb/tags
FROM mariadb:11.4.1-rc

COPY initSQL/dev.init.sql /docker-entrypoint-initdb.d/
