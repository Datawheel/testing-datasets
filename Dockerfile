FROM docker.io/library/clickhouse:25.1
LABEL version="0.2.0"

COPY ./table_data/ /docker-entrypoint-initdb.d/
COPY ./readonly.xml /etc/clickhouse-server/users.d/
