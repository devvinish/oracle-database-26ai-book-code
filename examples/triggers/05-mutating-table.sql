-- @expect-error
create or replace trigger employees_cap_trg
  before update of salary on employees
  for each row
declare
  v_max number;
begin
  select max(salary) into v_max from employees;          -- reads the table being changed
  if :new.salary > v_max then
    raise_application_error(-20101, 'Salary above the highest salary');
  end if;
end;
/
update employees set salary = salary + 1 where employee_id = 161;
-- @cleanup drop trigger if exists employees_cap_trg
