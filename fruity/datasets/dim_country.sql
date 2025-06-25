CREATE TABLE default.dim_country
(
    `country_id` Int64,
    `country_name` String,
    `country_iso2` String
)
ENGINE = MergeTree
ORDER BY country_id
SETTINGS index_granularity = 8192;

INSERT INTO default.dim_country
FROM INFILE '/docker-entrypoint-initdb.d/dim_country.csv'
FORMAT CSV;
