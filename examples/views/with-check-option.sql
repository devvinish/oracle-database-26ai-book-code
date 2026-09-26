-- @expect-error
create or replace view sales_staff as
select employee_id, first_name, last_name, department_id, salary
from   employees
where  department_id = 40
with check option constraint sales_staff_ck;

update sales_staff set salary = salary + 100 where employee_id = 154;
update sales_staff set department_id = 50 where employee_id = 154;
rollback;
