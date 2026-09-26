select department_id, last_name, salary,
       sum(salary) over (partition by department_id) as dept_payroll,
       round(salary / sum(salary) over (partition by department_id) * 100, 1) as pct_of_dept
from   employees
where  department_id in (50, 60)
order  by department_id, salary desc;
