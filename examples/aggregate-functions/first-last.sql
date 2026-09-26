select department_id,
       min(salary) keep (dense_rank first order by hire_date) as first_hire_salary,
       max(last_name) keep (dense_rank last order by hire_date) as newest_employee,
       max(hire_date) as newest_hire_date
from   employees
where  department_id in (20, 30, 40)
group  by department_id;
