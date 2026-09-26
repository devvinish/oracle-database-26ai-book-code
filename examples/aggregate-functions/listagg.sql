select c.country_name,
       listagg(a.airport_code, ', ') within group (order by a.airport_code) as airports
from   countries c join airports a on a.country_code = c.country_code
group  by c.country_name
having count(*) > 1;

select listagg(distinct a.country_code, '/') within group (order by a.country_code)
         as countries
from   routes r join airports a on a.airport_code = r.destination
where  r.origin = 'DXB' and r.distance_km < 3000;

-- 22 values of 300 characters do not fit in 4,000 bytes
select length(cities) as len, substr(cities, -24) as ending
from   (select listagg(rpad(city, 300, '.'), ', ' on overflow truncate '...' with count)
                 within group (order by city) as cities
        from   airports);
