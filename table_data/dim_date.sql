CREATE TABLE default.dim_date
(
    `date_id` Int64,
    `year` Int64,
    `quarter` String,
    `month` Int64,
    `month_name_en` String,
    `day_name_en` String,
    `month_name_es` String,
    `day_name_es` String
)
ENGINE = MergeTree
ORDER BY date_id
SETTINGS index_granularity = 8192;

INSERT INTO default.dim_date
FROM INFILE '/docker-entrypoint-initdb.d/dim_date.csv'
FORMAT CSV;
