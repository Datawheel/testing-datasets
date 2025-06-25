CREATE TABLE default.dim_color
(
    `color_id` Int64,
    `color_name_en` String,
    `color_name_es` String
)
ENGINE = MergeTree
ORDER BY color_id
SETTINGS index_granularity = 8192;

INSERT INTO default.dim_color
FROM INFILE '/docker-entrypoint-initdb.d/dim_color.csv'
FORMAT CSV;
