select a.airport_code, a.city, c.country_name, a.time_zone, a.is_hub
from   airports a join countries c on c.country_code = a.country_code
where  c.region = 'Asia'
order  by a.airport_code;
