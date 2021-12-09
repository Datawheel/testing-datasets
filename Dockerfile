FROM yandex/clickhouse-server:21.11
WORKDIR /
ADD . /
COPY populate.sh /docker-entrypoint-initdb.d/