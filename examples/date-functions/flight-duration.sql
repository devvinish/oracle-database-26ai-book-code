select f.flight_no, r.origin || '-' || r.destination as route,
       f.scheduled_arrival - f.scheduled_departure       as scheduled,
       f.actual_arrival - f.actual_departure             as actual,
       extract(hour from (f.scheduled_arrival - f.scheduled_departure)) * 60
         + extract(minute from (f.scheduled_arrival - f.scheduled_departure)) as minutes
from   flights f join routes r on r.route_id = f.route_id
where  f.flight_id in (100, 101, 102);
