CREATE TABLE default.dim_color
(
    `color_id` Int64,
    `color_name` String
)
ENGINE = MergeTree
ORDER BY color_id
SETTINGS index_granularity = 8192
