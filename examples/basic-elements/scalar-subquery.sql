select d.department_name,
       (select count(*) from employees e where e.department_id = d.department_id) as staff,
       (select max(salary) from employees e
        where  e.department_id = d.department_id) as top_pay
from   departments d
where  d.department_id in (20, 30, 90);
