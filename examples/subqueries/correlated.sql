-- employees who earn more than the average of their own department
select e.department_id, e.last_name, e.salary
from   employees e
where  e.salary > (select avg(x.salary) from employees x
                   where  x.department_id = e.department_id)
and    e.department_id in (30, 40)
order  by e.department_id, e.salary desc;
