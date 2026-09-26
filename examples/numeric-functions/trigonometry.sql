-- great-circle distance (haversine formula) between two airports, in kilometres
select r.origin, r.destination, r.distance_km as stored_km,
       round(2 * 6371 * asin(sqrt(
             power(sin((b.latitude - a.latitude) * acos(-1) / 360), 2)
           + cos(a.latitude * acos(-1) / 180) * cos(b.latitude * acos(-1) / 180)
           * power(sin((b.longitude - a.longitude) * acos(-1) / 360), 2)))) as computed_km
from   routes r
join   airports a on a.airport_code = r.origin
join   airports b on b.airport_code = r.destination
where  r.route_id in (1, 13, 41);
