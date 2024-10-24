FROM clickhouse/clickhouse-server:24.9

COPY ./table_data/ /docker-entrypoint-initdb.d/
