FROM docker.io/library/clickhouse:25.4
LABEL version="0.3.0"

COPY ../readonly.xml /etc/clickhouse-server/users.d/
COPY ./datasets/ /docker-entrypoint-initdb.d/
