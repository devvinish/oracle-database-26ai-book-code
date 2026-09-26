-- V-shapes in weekly bookings: a fall followed by a rise
select *
from   (select trunc(booked_at, 'IW') as week, count(*) as bookings
        from bookings group by trunc(booked_at, 'IW'))
match_recognize (
  order by week
  measures strt.week as from_week, last(down.week) as bottom_week, last(up.week) as to_week,
           classifier() as last_step, match_number() as match_no
  one row per match
  after match skip to last up
  pattern (strt down+ up+)
  define down as down.bookings < prev(down.bookings),
         up   as up.bookings   > prev(up.bookings)
)
where  rownum <= 4;
