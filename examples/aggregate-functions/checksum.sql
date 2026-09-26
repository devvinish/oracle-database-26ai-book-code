select checksum(airport_code) as codes, checksum(time_zone) as zones, count(*) as airports
from   airports;

select checksum(distinct country_code) as distinct_countries from airports;
