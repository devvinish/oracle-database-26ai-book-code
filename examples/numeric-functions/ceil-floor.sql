select distance_km, round(block_minutes / 60, 2) as hours,
       ceil(block_minutes / 60) as ceil_hours, floor(block_minutes / 60) as floor_hours
from   routes
where  route_id in (1, 12);

select ceil(-2.3) as ceil_neg, floor(-2.3) as floor_neg from dual;
