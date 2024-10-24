FROM clickhouse/clickhouse-server:24.9
LABEL version="0.2.0"

COPY ./table_data/ /docker-entrypoint-initdb.d/
