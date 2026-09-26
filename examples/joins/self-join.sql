select e.first_name || ' ' || e.last_name as employee, e.job_title,
       m.first_name || ' ' || m.last_name as manager
from   employees e
left   join employees m on m.employee_id = e.manager_id
where  e.department_id = 10 or e.employee_id in (111, 112)
order  by e.employee_id;
