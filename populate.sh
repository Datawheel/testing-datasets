#!/bin/sh
set -e

# ingest data tables into database
for table in 'dim_category' 'dim_color' 'dim_country' 'dim_date' 'dim_product' 'sales_fact'
do
    cat /tmp/table_data/$table.sql | clickhouse-client
    cat /tmp/table_data/$table.csv | clickhouse-client -q "INSERT INTO $table FORMAT CSV"
done

# remove data tables
rm -r /tmp/*

# remove entrypoint script
rm /docker-entrypoint-initdb.d/populate.sh
