select width_bucket(distance_km, 0, 16000, 4) as bucket,
       min(distance_km) as shortest, max(distance_km) as longest, count(*) as routes
from   routes
group  by width_bucket(distance_km, 0, 16000, 4)
order  by bucket;
