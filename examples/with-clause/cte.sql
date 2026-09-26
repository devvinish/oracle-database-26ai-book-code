with dept_pay as (
  select department_id, count(*) as staff, round(avg(salary)) as avg_salary
  from   employees
  group  by department_id
),
big_depts as (
  select * from dept_pay where staff >= 10
)
select d.department_name, b.staff, b.avg_salary
from   big_depts b join departments d on d.department_id = b.department_id;
