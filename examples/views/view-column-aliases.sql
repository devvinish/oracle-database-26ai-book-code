create or replace view department_pay (department, staff, payroll, top_salary) as
select d.department_name, count(*), sum(e.salary), max(e.salary)
from   departments d join employees e on e.department_id = d.department_id
group  by d.department_name;

select * from department_pay where staff >= 10 order by payroll desc;
