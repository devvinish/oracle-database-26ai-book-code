-- the reporting chain below the Director of Flight Operations
with chain (employee_id, name, manager_id, lvl) as (
  select employee_id, first_name || ' ' || last_name, manager_id, 1
  from   employees where employee_id = 110
  union all
  select e.employee_id, e.first_name || ' ' || e.last_name, e.manager_id, c.lvl + 1
  from   employees e join chain c on e.manager_id = c.employee_id
)
select lpad(' ', 2 * (lvl - 1)) || name as org_chart, lvl
from   chain
where  lvl <= 3;
