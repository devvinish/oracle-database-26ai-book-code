-- a row for every day of a week
with days (d) as (
  select date '2026-03-09' from dual
  union all
  select d + 1 from days where d < date '2026-03-15'
)
select d, to_char(d, 'Dy') as weekday,
       (select count(*) from flights f
        where  trunc(cast(f.scheduled_departure at time zone 'UTC' as date)) = days.d)
         as flights
from   days;
