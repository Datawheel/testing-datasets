CREATE TABLE default.dim_product
(
    `product_id` Int64,
    `product_name_en` String,
    `product_name_es` String
)
ENGINE = MergeTree
ORDER BY product_id
SETTINGS index_granularity = 8192;

INSERT INTO default.dim_product
FROM INFILE '/docker-entrypoint-initdb.d/dim_product.csv'
FORMAT CSV;
