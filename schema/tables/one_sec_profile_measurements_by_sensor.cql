CREATE TABLE hydroview.one_sec_profile_measurements_by_sensor (
    sensor_id uuid,
    parameter_id uuid,
    qc_level int,
    date date,
    timestamp timestamp,
    vertical_position float,
    avg_value float,
    max_value float,
    min_value float,
    unit text static,
    PRIMARY KEY ((sensor_id, parameter_id, qc_level, date), timestamp, vertical_position)
) WITH CLUSTERING ORDER BY (timestamp DESC, vertical_position DESC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';