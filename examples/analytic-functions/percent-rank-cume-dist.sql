select last_name, salary,
       round(percent_rank() over (order by salary), 3) as percent_rank,
       round(cume_dist()    over (order by salary), 3) as cume_dist
from   employees
where  department_id = 40
order  by salary;
