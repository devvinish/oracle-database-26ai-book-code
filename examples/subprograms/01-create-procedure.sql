create or replace procedure raise_salary (
  p_employee_id in  employees.employee_id%type,
  p_percent     in  number default 5,
  p_new_salary  out employees.salary%type
) is
begin
  update employees
  set    salary = round(salary * (1 + p_percent / 100))
  where  employee_id = p_employee_id
  returning salary into p_new_salary;
end raise_salary;
/
declare
  v_salary employees.salary%type;
begin
  raise_salary(161, 10, v_salary);                               -- positional
  dbms_output.put_line('New salary: ' || v_salary);
  raise_salary(p_employee_id => 162, p_new_salary => v_salary);  -- named, default percent
  dbms_output.put_line('New salary: ' || v_salary);
  rollback;
end;
/
