select last_name, salary,
       ntile(4) over (order by salary desc) as quartile
from   employees
where  department_id = 30
order  by salary desc;
