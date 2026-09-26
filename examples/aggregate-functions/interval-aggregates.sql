select r.origin || '-' || r.destination as route, count(*) as flights,
       sum(f.actual_arrival - f.actual_departure) as time_in_air,
       avg(f.actual_arrival - f.actual_departure) as average_flight,
       max(f.actual_departure - f.scheduled_departure) as worst_delay
from   flights f join routes r on r.route_id = f.route_id
where  f.status = 'ARRIVED' and r.origin = 'DXB' and r.destination in ('LHR', 'SYD')
group  by r.origin, r.destination;
