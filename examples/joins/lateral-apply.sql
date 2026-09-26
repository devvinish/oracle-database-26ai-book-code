-- the two longest routes from each of three airports
select a.airport_code, x.destination, x.distance_km
from   airports a
cross  apply (select r.destination, r.distance_km from routes r
              where r.origin = a.airport_code
              order by r.distance_km desc fetch first 2 rows only) x
where  a.airport_code in ('SIN', 'SYD', 'KTM');

select a.airport_code, x.destination
from   airports a
outer  apply (select r.destination from routes r where r.origin = a.airport_code
              order by r.distance_km desc fetch first 1 row only) x
where  a.airport_code in ('SIN', 'KTM');

select a.airport_code, x.routes
from   airports a,
       lateral (select count(*) as routes from routes r where r.origin = a.airport_code) x
where  a.airport_code in ('DXB', 'LHR');
