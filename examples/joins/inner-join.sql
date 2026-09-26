select a.airport_code, a.city, c.country_name
from   airports a
join   countries c on c.country_code = a.country_code
where  c.region = 'Europe'
order  by a.airport_code;
