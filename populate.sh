#!/bin/sh
set -e

for table in 'dim_category' 'dim_color' 'dim_country' 'dim_date' 'dim_product' 'sales_fact'
do
    cat table_data/$table.sql | clickhouse-client
    cat table_data/$table.csv | clickhouse-client -q "INSERT INTO $table FORMAT CSV"
done