select last_name, hire_date, salary,
       row_number() over w as seq,
       sum(salary)  over w as running_payroll,
       avg(salary)  over (w rows between 1 preceding and current row) as avg_with_previous
from   employees
where  department_id = 50
window w as (order by hire_date)
order  by hire_date;
