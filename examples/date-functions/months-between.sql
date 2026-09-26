select first_name, last_name, hire_date,
       trunc(months_between(date '2026-03-15', hire_date) / 12) as years_of_service,
       round(months_between(date '2026-03-15', hire_date), 1)   as months
from   employees
where  department_id = 50
order  by hire_date;
