select department_id, last_name, hire_date,
       first_value(last_name) over w as first_hired,
       last_value(last_name)  over w as last_hired,
       nth_value(last_name, 2) over w as second_hired
from   employees
where  department_id in (50, 60)
window w as (partition by department_id order by hire_date
             rows between unbounded preceding and unbounded following)
order  by department_id, hire_date;
