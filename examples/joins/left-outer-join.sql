select a.airport_code, a.city, count(r.route_id) as routes_from_here
from   airports a
left   join routes r on r.origin = a.airport_code
where  a.country_code in ('NP', 'IN')
group  by a.airport_code, a.city
order  by a.airport_code;
