FROM clickhouse/clickhouse-server:21.11
COPY . /tmp/
COPY populate.sh /docker-entrypoint-initdb.d/
