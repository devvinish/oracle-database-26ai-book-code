select json_object('origin' value origin,
                   'destinations' value json_arrayagg(destination order by destination))
         as network
from   routes
where  origin in ('SIN', 'SYD')
group  by origin;

select json_objectagg(key cabin value avg_fare) as avg_fare_by_cabin
from   (select cabin, round(avg(fare)) as avg_fare from tickets group by cabin);

select json_array(select airport_code from airports where country_code = 'IN'
                  order by airport_code) as indian_airports;
