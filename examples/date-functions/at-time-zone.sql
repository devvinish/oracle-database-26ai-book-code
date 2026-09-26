select f.flight_no, r.origin || '-' || r.destination as route,
       f.scheduled_departure                        as departs_local,
       f.scheduled_departure at time zone 'UTC'     as departs_utc
from   flights f
join   routes r on r.route_id = f.route_id
where  f.flight_id in (100, 101);

select flight_no, scheduled_arrival as arrives_local,
       scheduled_arrival at time zone 'Asia/Kolkata' as in_india
from   flights
where  flight_id = 101;
