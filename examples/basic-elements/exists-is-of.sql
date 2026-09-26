select a.airport_code, a.city
from   airports a
where  not exists (select null from routes r where r.origin = a.airport_code);

select c.country_name
from   countries c
where  exists (select null from customers u where u.country_code = c.country_code)
and    not exists (select null from airports a where a.country_code = c.country_code);
