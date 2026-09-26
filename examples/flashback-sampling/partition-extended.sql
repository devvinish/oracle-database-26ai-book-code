-- @setup drop table if exists flights_by_month purge
create table flights_by_month
partition by range (dep_date) (
  partition p_2026_01 values less than (date '2026-02-01'),
  partition p_2026_02 values less than (date '2026-03-01'),
  partition p_2026_03 values less than (date '2026-04-01'),
  partition p_later   values less than (maxvalue)
)
as select flight_id, flight_no,
          cast(sys_extract_utc(scheduled_departure) as date) as dep_date
   from   flights;

select count(*) as feb_flights from flights_by_month partition (p_2026_02);

select count(*) as march_flights
from   flights_by_month partition for (date '2026-03-15');
-- @cleanup drop table if exists flights_by_month purge
