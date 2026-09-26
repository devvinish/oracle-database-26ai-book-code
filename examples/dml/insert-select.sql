-- @setup drop table if exists busy_days purge
create table busy_days (day date, departures number);

insert into busy_days (day, departures)
select trunc(cast(sys_extract_utc(scheduled_departure) as date)), count(*)
from   flights
group  by trunc(cast(sys_extract_utc(scheduled_departure) as date))
having count(*) >= 36;

select count(*) as busy_days, min(day) as first_busy_day from busy_days;
-- @cleanup drop table if exists busy_days purge
