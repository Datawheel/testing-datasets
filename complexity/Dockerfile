FROM docker.io/library/clickhouse:25.4
LABEL version="0.2.0"

COPY gcs-downloads/complexity/* /docker-entrypoint-initdb.d/

COPY complexity/create.sql /docker-entrypoint-initdb.d/
