-- @setup drop table if exists salary_history purge
-- @setup create table salary_history (employee_id number, old_salary number, new_salary number, changed_by varchar2(30), changed_at timestamp)
create or replace trigger employees_salary_trg
  after update of salary on employees
  for each row
  when (new.salary <> old.salary)
begin
  insert into salary_history
  values (:new.employee_id, :old.salary, :new.salary, user, localtimestamp);
end;
/
update employees set salary = salary * 1.10 where department_id = 50;

select employee_id, old_salary, new_salary, changed_by from salary_history;
rollback;
