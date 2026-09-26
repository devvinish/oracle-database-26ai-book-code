select last_name, department_id, salary
from   employees
where  (department_id, salary) in (select department_id, max(salary)
                                   from employees group by department_id)
order  by department_id;
