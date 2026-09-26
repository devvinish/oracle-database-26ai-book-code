select country_code, a.city, c.country_name
from   airports a join countries c using (country_code)
where  country_code = 'IN';

select country_code, city, country_name
from   airports natural join countries
where  country_code = 'US';
