-- runs of consecutive delayed departures (15 minutes or more) on route 1
select *
from   (select flight_no, scheduled_departure as sched,
               extract(hour from (actual_departure - scheduled_departure)) * 60
                 + extract(minute from (actual_departure - scheduled_departure)) as delay
        from   flights
        where  route_id = 1 and status = 'ARRIVED')
match_recognize (
  order by sched
  measures first(late.sched) as run_start, count(late.*) as flights,
           max(late.delay) as worst_delay
  one row per match
  pattern (late{2,})
  define late as late.delay >= 15
);
