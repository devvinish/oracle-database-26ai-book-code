select case grouping(c.region) when 1 then 'All regions' else c.region end as region,
       case grouping(a.country_code) when 1 then 'All' else a.country_code end as country,
       grouping_id(c.region, a.country_code) as gid,
       count(*) as airports
from   airports a join countries c on c.country_code = a.country_code
where  c.region in ('Oceania', 'Africa')
group  by rollup (c.region, a.country_code);

select a.country_code, count(*) as airports, group_id() as gid
from   airports a
where  a.country_code in ('IN', 'US')
group  by grouping sets ((a.country_code), (a.country_code));
