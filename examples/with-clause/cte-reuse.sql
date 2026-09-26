with monthly as (
  select to_char(booked_at, 'YYYY-MM') as month, count(*) as bookings
  from   bookings group by to_char(booked_at, 'YYYY-MM')
)
select m.month, m.bookings, round(100 * m.bookings / (select sum(bookings) from monthly), 1)
         as pct_of_all
from   monthly m
order  by m.month;
