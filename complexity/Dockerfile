FROM docker.io/library/clickhouse:25.4
LABEL version="0.2.0"

COPY gcs-downloads/complexity/* /var/lib/clickhouse/user_files/

COPY complexity/create.sql /docker-entrypoint-initdb.d/
