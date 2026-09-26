-- @setup drop table if exists flight_log purge
create table flight_log (
  flight_id  number,
  flown_on   date,
  status     varchar2(10)
)
partition by range (flown_on) interval (numtoyminterval(1, 'MONTH'))
(partition p_before_2026 values less than (date '2026-01-01'));

insert into flight_log
select flight_id, cast(sys_extract_utc(scheduled_departure) as date), status from flights;
commit;
exec dbms_stats.gather_table_stats(user, 'FLIGHT_LOG')

select partition_name, interval, num_rows
from   user_tab_partitions
where  table_name = 'FLIGHT_LOG'
order  by partition_position;
