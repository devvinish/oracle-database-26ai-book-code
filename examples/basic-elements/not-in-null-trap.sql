-- employees who manage nobody: NOT IN finds none, because the list contains a NULL
select count(*) as with_not_in
from   employees
where  employee_id not in (select manager_id from employees);

select count(*) as with_not_exists
from   employees e
where  not exists (select null from employees x where x.manager_id = e.employee_id);
