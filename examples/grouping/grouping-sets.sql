select e.department_id, e.base_airport, count(*) as staff
from   employees e
where  e.department_id in (20, 40)
group  by grouping sets ((e.department_id), (e.base_airport), ())
order  by 1, 2;
