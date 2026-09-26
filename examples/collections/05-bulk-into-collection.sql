declare
  type t_employees is table of employees%rowtype;
  v_staff t_employees;
begin
  select * bulk collect into v_staff
  from   employees where department_id = 50 order by salary desc;
  for i in 1 .. v_staff.count loop
    dbms_output.put_line(v_staff(i).last_name || ' ' || v_staff(i).salary);
  end loop;
end;
/
