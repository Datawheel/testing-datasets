CREATE TABLE default.dim_date
(
    `date_id` Int64,
    `year` Int64,
    `quarter` String,
    `month` Int64,
    `month_name` String,
    `day_name` String
)
ENGINE = MergeTree
ORDER BY date_id
SETTINGS index_granularity = 8192
