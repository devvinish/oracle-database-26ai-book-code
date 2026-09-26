-- @setup drop table if exists airport_vectors purge
-- each airport as a point on the unit sphere: [x, y, z] from its latitude and longitude
create table airport_vectors as
select airport_code, city,
       to_vector('[' || round(cos(lat) * cos(lon), 6) || ','
                     || round(cos(lat) * sin(lon), 6) || ','
                     || round(sin(lat), 6) || ']', 3, float32) as position
from   (select airport_code, city,
               latitude * acos(-1) / 180 as lat, longitude * acos(-1) / 180 as lon
        from   airports);

select airport_code, city, position
from   airport_vectors
where  airport_code in ('DXB', 'SYD');
