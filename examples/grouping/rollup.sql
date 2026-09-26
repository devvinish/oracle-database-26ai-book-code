select c.region, a.country_code, count(*) as airports
from   airports a join countries c on c.country_code = a.country_code
where  c.region in ('Asia', 'Europe')
group  by rollup (c.region, a.country_code)
order  by c.region, a.country_code;
