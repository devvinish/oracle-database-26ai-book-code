select city, elevation_ft * 0.3048 as elevation_m
from   airports
order  by elevation_m desc
fetch  first 3 rows only;

select city, country_code from airports order by 2, 1 fetch first 4 rows only;
