CREATE TABLE default.dim_category
(
    `category_id` Int64,
    `category_name_en` String,
    `category_name_es` String
)
ENGINE = MergeTree
ORDER BY category_id
SETTINGS index_granularity = 8192;

INSERT INTO default.dim_category
FROM INFILE '/docker-entrypoint-initdb.d/dim_category.csv'
FORMAT CSV;
