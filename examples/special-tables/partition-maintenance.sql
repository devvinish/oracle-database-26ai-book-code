alter table flight_log split partition p_before_2026 at (date '2025-12-01')
  into (partition p_before_dec_2025, partition p_dec_2025);
alter table flight_log truncate partition p_before_dec_2025;
alter table flight_log drop partition p_before_dec_2025;

select partition_name, partition_position
from   user_tab_partitions
where  table_name = 'FLIGHT_LOG'
order  by partition_position
fetch  first 3 rows only;
-- @cleanup drop table if exists flight_log purge
