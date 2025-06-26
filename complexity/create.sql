CREATE TABLE dim_chl_communes (
    `region_id` Int64,
    `region_name` String,
    `commune_id` Int64,
    `commune_name` String
)
ENGINE = MergeTree()
ORDER BY commune_id;

CREATE TABLE dim_chl_payment_types (
    `payment_type_id` Int64,
    `payment_type_es` String,
    `payment_type_en` String
)
ENGINE = MergeTree()
ORDER BY payment_type_id;

CREATE TABLE dim_chl_ports_of_entry (
    `country_id` String,
    `port_id` Int64,
    `port_name` String
)
ENGINE = MergeTree()
ORDER BY port_id;

CREATE TABLE dim_chl_transport_modes (
    `transport_id` Int64,
    `transport_name` String
)
ENGINE = MergeTree()
ORDER BY transport_id;

CREATE TABLE dim_country (
    `continent_id` String,
    `continent` String,
    `geo_id` String,
    `country` String
)
ENGINE = MergeTree()
ORDER BY geo_id;

CREATE TABLE dim_esp_provinces (
    `autonomous_id` UInt8,
    `autonomous_name` String,
    `autonomous_name_es` String,
    `autonomous_name_zh` String,
    `province_id` UInt8,
    `province_name` String,
    `province_name_es` String,
    `province_name_zh` String
)
ENGINE = MergeTree()
ORDER BY province_id;

CREATE TABLE dim_hs4 (
    `section_id` UInt32,
    `section` String,
    `hs2_id` UInt32,
    `hs2` String,
    `hs4_id` UInt32,
    `hs4` String
)
ENGINE = MergeTree()
PRIMARY KEY hs4_id
ORDER BY hs4_id;

CREATE TABLE dim_shared_hs96 (
    `section` String,
    `section_name` String,
    `section_name_es` String,
    `section_id` UInt8,
    `hs2` String,
    `hs2_name` String,
    `hs2_name_es` String,
    `hs2_id` UInt16,
    `hs4` String,
    `hs4_name` String,
    `hs4_name_es` String,
    `hs4_id` UInt32,
    `hs6` String,
    `hs6_name` String,
    `hs6_name_es` String,
    `hs6_id` UInt32
)
ENGINE = MergeTree()
PRIMARY KEY hs6_id
ORDER BY hs6_id;

CREATE TABLE dim_shared_master_hs6 (
    `section_id` UInt8,
    `section` String,
    `section_name` String,
    `section_name_es` Nullable(String),
    `hs2_id` UInt16,
    `hs2` String,
    `hs2_name` String,
    `hs2_name_es` Nullable(String),
    `hs4_id` UInt32,
    `hs4` String,
    `hs4_name` String,
    `hs4_name_es` Nullable(String),
    `hs6_id` UInt32,
    `hs6` String,
    `hs6_name` String,
    `hs6_name_es` Nullable(String)
)
ENGINE = MergeTree()
ORDER BY hs6_id;

CREATE TABLE dim_shared_time (
    `year` UInt16,
    `month` UInt8,
    `month_name` String,
    `quarter` UInt8,
    `quarter_name` String,
    `time_id` UInt32
)
ENGINE = MergeTree()
ORDER BY time_id;

CREATE TABLE dim_shared_time_currency (
    `year` UInt16,
    `quarter` UInt8,
    `quarter_name` String,
    `quarter_name_es` String,
    `quarter_name_zh` String,
    `month` UInt8,
    `month_name` String,
    `month_name_es` String,
    `month_name_zh` String,
    `time_id` UInt32,
    `cad_usd` Decimal(3),
    `sar_usd` Decimal(3),
    `gbp_usd` Decimal(3),
    `myr_usd` Decimal(3),
    `zar_usd` Decimal(3),
    `sek_usd` Decimal(3),
    `jpy_usd` Decimal(3),
    `eur_usd` Decimal(3),
    `sgd_usd` Decimal(3),
    `aud_usd` Decimal(3),
    `nok_usd` Decimal(3),
    `chf_usd` Decimal(3),
    `qar_usd` Decimal(3)
)
ENGINE = MergeTree()
ORDER BY time_id;

CREATE TABLE dim_skill (
    `element_id` String,
    `element_name` String,
    `element_group_id` String,
    `element_group_name` String
)
ENGINE = MergeTree()
ORDER BY element_id;

CREATE TABLE emissions (
    `oec_id` String,
    `emissions` Float64
)
ENGINE = MergeTree()
PRIMARY KEY oec_id
ORDER BY oec_id;

CREATE TABLE gini (
    `oec_id` String,
    `gini` Float64
)
ENGINE = MergeTree()
PRIMARY KEY oec_id
ORDER BY oec_id;

CREATE TABLE national_exports (
    `oec_id` String,
    `hs4_id` UInt32,
    `trade_value` Float64,
    `with_oil` UInt16,
    `year` UInt16
)
ENGINE = MergeTree()
PRIMARY KEY (oec_id, hs4_id)
ORDER BY (oec_id, hs4_id);

CREATE TABLE onet_by_pums (
    `onet_code` String,
    `element_id` String,
    `element_name` String,
    `date` String,
    `im` Float32,
    `lv` Float32,
    `year` UInt16,
    `bls_code` String,
    `pums_code` Nullable(String),
    `total_score` Float32
)
ENGINE = MergeTree()
ORDER BY (onet_code, element_id, date, bls_code);

CREATE TABLE pums_dims_soc (
    `id` String,
    `name` String,
    `parent` String,
    `grandparent` String,
    `great_grandparent` String,
    `name_long` String,
    `image_author` String,
    `image_link` String,
    `image_meta` String,
    `keywords` String,
    `level` UInt16,
    `url_name` String,
    `parent_name` String,
    `grandparent_name` String,
    `great_grandparent_name` String
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE shapes2017_counties (
    `geoid` String,
    `aland` Float32,
    `name` String,
    `state_id` String,
    `state_name` String
)
ENGINE = MergeTree()
PRIMARY KEY geoid
ORDER BY geoid;

CREATE TABLE shapes2017_msas (
    `geoid` String,
    `name` String,
    `aland` Float32
)
ENGINE = MergeTree()
PRIMARY KEY geoid
ORDER BY geoid;

CREATE TABLE shapes2017_places (
    `state_id` String,
    `state_name` String,
    `geoid` String,
    `name` String,
    `aland` Float32
)
ENGINE = MergeTree()
PRIMARY KEY geoid
ORDER BY geoid;

CREATE TABLE shapes2017_pumas (
    `state_id` String,
    `state_name` String,
    `geoid` String,
    `name` String,
    `aland10` Float32
)
ENGINE = MergeTree()
PRIMARY KEY geoid
ORDER BY geoid;

CREATE TABLE shapes2017_states (
    `geoid` String,
    `name` String,
    `aland` Float32
)
ENGINE = MergeTree()
PRIMARY KEY geoid
ORDER BY geoid;

CREATE TABLE shapes2017_us (
    `geoid` String,
    `name` String
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE trade_i_baci_a_96 (
    `year` UInt16,
    `exporter` String,
    `importer` String,
    `hs_master_id` UInt32,
    `value` Float64,
    `quantity` Float64,
    `unit_id` UInt16
)
ENGINE = MergeTree()
PRIMARY KEY (year, exporter, importer, hs_master_id)
ORDER BY (year, exporter, importer, hs_master_id);

CREATE TABLE trade_s_chl_m_hs (
    `time_id` UInt32,
    `commune_id` UInt32,
    `country_id` String,
    `trade_flow_id` UInt8,
    `hs_master_id` UInt32,
    `payment_type_id` UInt8,
    `transport_id` UInt8,
    `weight_kg` Nullable(Float64),
    `origin_port_id` UInt16,
    `destination_port_id` UInt16,
    `unit_id` UInt16,
    `value` Float64,
    `quantity` Nullable(Float64)
)
ENGINE = MergeTree()
PRIMARY KEY (time_id, commune_id, country_id, trade_flow_id, hs_master_id)
ORDER BY (time_id, commune_id, country_id, trade_flow_id, hs_master_id);

CREATE TABLE trade_s_esp_m_hs (
  `time_id` UInt32,
  `country_id` String,
  `province_id` UInt8,
  `trade_flow_id` UInt8,
  `hs_master_id` UInt32,
  `unit_id` UInt16,
  `hs_revision` String,
  `value` Float64,
  `weight` Float64,
  `quantity` Nullable(Float64),
  `unit_value` Nullable(Float64)
)
ENGINE = MergeTree()
ORDER BY (time_id, province_id, country_id, trade_flow_id, hs_master_id);


INSERT INTO dim_chl_communes
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_chl_communes.parquet', 'Parquet');

INSERT INTO dim_chl_payment_types
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_chl_payment_types.parquet', 'Parquet');

INSERT INTO dim_chl_ports_of_entry
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_chl_ports_of_entry.parquet', 'Parquet');

INSERT INTO dim_chl_transport_modes
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_chl_transport_modes.parquet', 'Parquet');

INSERT INTO dim_country
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_country.parquet', 'Parquet');

INSERT INTO dim_esp_provinces
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_esp_provinces.parquet', 'Parquet');

INSERT INTO dim_hs4
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_hs4.parquet', 'Parquet');

INSERT INTO dim_shared_hs96
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_shared_hs96.parquet', 'Parquet');

INSERT INTO dim_shared_master_hs6
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_shared_master_hs6.parquet', 'Parquet');

INSERT INTO dim_shared_time
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_shared_time.parquet', 'Parquet');

INSERT INTO dim_shared_time_currency
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_shared_time_currency.parquet', 'Parquet');

INSERT INTO dim_skill
    SELECT * FROM file('/var/lib/clickhouse/user_files/dim_skill.parquet', 'Parquet');

INSERT INTO emissions
    SELECT * FROM file('/var/lib/clickhouse/user_files/emissions.parquet', 'Parquet');

INSERT INTO gini
    SELECT * FROM file('/var/lib/clickhouse/user_files/gini.parquet', 'Parquet');

INSERT INTO national_exports
    SELECT * FROM file('/var/lib/clickhouse/user_files/national_exports.parquet', 'Parquet');

INSERT INTO onet_by_pums
    SELECT * FROM file('/var/lib/clickhouse/user_files/onet_by_pums.parquet', 'Parquet');

INSERT INTO pums_dims_soc
    SELECT * FROM file('/var/lib/clickhouse/user_files/pums_dims_soc.parquet', 'Parquet');

INSERT INTO shapes2017_counties
    SELECT * FROM file('/var/lib/clickhouse/user_files/shapes2017_counties.parquet', 'Parquet');

INSERT INTO shapes2017_msas
    SELECT * FROM file('/var/lib/clickhouse/user_files/shapes2017_msas.parquet', 'Parquet');

INSERT INTO shapes2017_places
    SELECT * FROM file('/var/lib/clickhouse/user_files/shapes2017_places.parquet', 'Parquet');

INSERT INTO shapes2017_pumas
    SELECT * FROM file('/var/lib/clickhouse/user_files/shapes2017_pumas.parquet', 'Parquet');

INSERT INTO shapes2017_states
    SELECT * FROM file('/var/lib/clickhouse/user_files/shapes2017_states.parquet', 'Parquet');

INSERT INTO shapes2017_us
    SELECT * FROM file('/var/lib/clickhouse/user_files/shapes2017_us.parquet', 'Parquet');

INSERT INTO trade_i_baci_a_96
    SELECT * FROM file('/var/lib/clickhouse/user_files/trade_i_baci_a_96.parquet', 'Parquet');

INSERT INTO trade_s_chl_m_hs
    SELECT * FROM file('/var/lib/clickhouse/user_files/trade_s_chl_m_hs.parquet', 'Parquet');

INSERT INTO trade_s_esp_m_hs
    SELECT * FROM file('/var/lib/clickhouse/user_files/trade_s_esp_m_hs.parquet', 'Parquet');
