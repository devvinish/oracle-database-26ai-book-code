select r.origin, count(*) as routes, round(avg(r.distance_km)) as avg_km
from   routes r
group  by r.origin
having count(*) > 1
order  by routes desc, r.origin;
