CREATE TABLE default.sales_fact
(
    `date_id` Int64,
    `origin_country_id` Int64,
    `destination_country_id` Int64,
    `product_id` Int64,
    `category_id` Int64,
    `color_id` Int64,
    `duration` Float64,
    `units` Int64,
    `amount` Int64
)
ENGINE = MergeTree
ORDER BY date_id
SETTINGS index_granularity = 8192;

INSERT INTO default.sales_fact
FROM INFILE '/docker-entrypoint-initdb.d/sales_fact.csv'
FORMAT CSV;
