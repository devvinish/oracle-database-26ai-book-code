select f.flight_no, r.origin || '-' || r.destination as route,
       to_char(f.scheduled_departure, 'DD-MON HH24:MI TZR') as departs,
       to_char(f.scheduled_arrival, 'DD-MON HH24:MI TZR') as arrives
from   flights f join routes r on r.route_id = f.route_id
where  f.flight_id = 1000;
