select count(*)                     as employees,
       count(commission_pct)        as with_commission,
       count(distinct department_id) as departments,
       sum(salary)                  as payroll,
       round(avg(salary), 2)        as avg_salary,
       min(hire_date)               as first_hire,
       max(hire_date)               as last_hire
from   employees;

select department_id, count(*) as staff, sum(salary) as payroll, max(salary) as top_salary
from   employees
group  by department_id
order  by department_id
fetch  first 4 rows only;
