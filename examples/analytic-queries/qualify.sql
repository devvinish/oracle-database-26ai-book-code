-- the best-paid employee of each department, without a subquery
select department_id, last_name, salary
from   employees
qualify row_number() over (partition by department_id order by salary desc) = 1
order  by department_id;
