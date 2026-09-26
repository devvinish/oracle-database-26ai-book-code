-- the last known actual arrival before each flight of a route
select flight_no, to_char(scheduled_departure, 'DD-MON') as day, status,
       to_char(lag(actual_arrival) ignore nulls over (order by scheduled_departure),
               'DD-MON HH24:MI') as last_known_arrival
from   flights
where  route_id = 7
and    scheduled_departure between timestamp '2026-03-08 00:00:00 UTC'
                               and timestamp '2026-03-20 00:00:00 UTC';
