select last_name, commission_pct from employees
where  commission_pct is not null
order  by commission_pct desc
fetch  first 3 rows only;

select last_name, commission_pct from employees
where  commission_pct is not null
order  by commission_pct desc
fetch  first 3 rows with ties;

select count(*) as rows_in_5_percent
from   (select * from flights order by scheduled_departure fetch first 5 percent rows only);
