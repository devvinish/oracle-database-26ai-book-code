select c.country_code, c.country_name, a.airport_code
from   airports a
right  join countries c on c.country_code = a.country_code
where  c.region = 'Europe'
order  by c.country_code, a.airport_code;

select coalesce(c.country_code, a.country_code) as code, c.country_name, a.airport_code
from   (select * from countries where region = 'Oceania') c
full   join (select * from airports where airport_code in ('SYD', 'NRT')) a
       on a.country_code = c.country_code;
