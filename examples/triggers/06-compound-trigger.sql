-- @expect-error
create or replace trigger employees_cap_trg
  for update of salary on employees
  compound trigger
  v_max number;

  before statement is
  begin
    -- read once, before the rows change
    select max(salary) into v_max from employees;
  end before statement;

  before each row is
  begin
    if :new.salary > v_max then
      raise_application_error(-20101, 'Salary above ' || v_max);
    end if;
  end before each row;
end employees_cap_trg;
/
update employees set salary = salary + 1 where employee_id = 161;
update employees set salary = 50000 where employee_id = 162;
rollback;
-- @cleanup drop trigger if exists employees_cap_trg
