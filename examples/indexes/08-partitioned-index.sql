-- @setup drop table if exists flight_log purge
-- @setup create table flight_log (flight_id number, flown_on date, status varchar2(10)) partition by range (flown_on) interval (numtoyminterval(1, 'MONTH')) (partition p_before_2026 values less than (date '2026-01-01'))
-- @setup insert into flight_log select flight_id, cast(sys_extract_utc(scheduled_departure) as date), status from flights
-- @setup commit
create index flight_log_status_ix on flight_log (status) local;
create index flight_log_id_ix on flight_log (flight_id) global;

select index_name, partitioned, locality, partition_count
from   user_indexes left join user_part_indexes using (index_name, table_name)
where  table_name = 'FLIGHT_LOG';
-- @cleanup drop table if exists flight_log purge
