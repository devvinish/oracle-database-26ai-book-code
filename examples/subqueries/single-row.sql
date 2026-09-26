select last_name, salary
from   employees
where  salary > (select avg(salary) from employees)
and    department_id = 30;
